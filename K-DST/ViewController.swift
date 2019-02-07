//
//  ViewController.swift
//  K-DST
//
//  Created by Alexander Titterton on 20/03/2018.
//  Copyright © 2018 Alexander Titterton. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ViewController: UIViewController {
    
    // Swipe image container
    @IBOutlet weak var swipeImageView: UIImageView!
    // Type in the names of your images below
    let imageNames = ["icons/Icon-256","icons/LSRR","icons/BCTR"]
    let CC_images = ["icons/KDST_CC.jpg", "icons/LSRR_CC.jpg", "icons/BCTR_CC"]
    let stationNames = ["K-DST", "Los Santos Rock Radio", "Blaine County FM"]
    var currentImage = 0
    
    var backgroundContinue: Bool = false
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    @objc func defaultsChanged(){
        if UserDefaults.standard.bool(forKey: "backgroundContinue") {
            self.backgroundContinue = true
        }
        else {
            self.backgroundContinue = false
        }
    }
    
    //var audioQueue = LSRR()
    var audioQueues = [KDST(), LSRR(), BCTR()]
    var hasBeenPaused = true
    
    @objc func autoPlayRadio() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if appDelegate.autoPlay != -1
        {
            // Same as pressing reshuffle button
            audioQueues[currentImage].isMuted = true
            currentImage = appDelegate.autoPlay
            swipeImageView.image = UIImage(named: imageNames[currentImage])
            //if currentImage == 0 {audioQueues[currentImage] = KDST()}
            //else if currentImage == 1 {audioQueues[currentImage] = LSRR()}
            //else {audioQueues[currentImage] = BCTR()}
            setOnPlay()
            swipeImageView.image = UIImage(named: imageNames[currentImage])
            let image = UIImage(named: CC_images[currentImage])!
            let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                return image
            })
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationNames[currentImage], MPMediaItemPropertyArtist: stationNames[currentImage], MPMediaItemPropertyArtwork: artwork]
            hasBeenPaused = false
        }
    }
    
    func prepareSongAndSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                try audioSession.setActive(true)
                UIApplication.shared.beginReceivingRemoteControlEvents()
                setupCommandCenter()
            } catch let sessionError {
                print(sessionError)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        swipeImageView.image = UIImage(named: imageNames[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)

        // Do any additional setup after loading the view, typically from a nib.
        prepareSongAndSession() // Gets playlist ready
        
        registerSettingsBundle()
        
        // Checks if autoPlay bool has been triggered each time app enters foreground
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController.autoPlayRadio),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
        
        defaultsChanged()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    func changeStation(oldStation: Int, newStation: Int) {
        if hasBeenPaused == false
        {
            audioQueues[oldStation].isMuted = true
            audioQueues[newStation].isMuted = false
            audioQueues[newStation].play()
            if backgroundContinue == false {audioQueues[oldStation].pause()}
        }
        // setupCommandCenter()
        swipeImageView.image = UIImage(named: imageNames[currentImage])
        let image = UIImage(named: CC_images[currentImage])!
        let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
            return image
        })
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationNames[currentImage], MPMediaItemPropertyArtist: stationNames[currentImage], MPMediaItemPropertyArtwork: artwork]
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            let oldImage = currentImage
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                if currentImage == imageNames.count - 1 {
                    currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                swipeImageView.image = UIImage(named: imageNames[currentImage])
                
            case UISwipeGestureRecognizerDirection.right:
                if currentImage == 0 {
                    currentImage = imageNames.count - 1
                }else{
                    currentImage -= 1
                }
                swipeImageView.image = UIImage(named: imageNames[currentImage])
            default:
                break
            }
            changeStation(oldStation: oldImage, newStation: currentImage)
        }
    }
    
    func swipeLeft() {
        print("swipeLeft called")
        audioQueues[currentImage].isMuted = true
        if backgroundContinue == false {audioQueues[currentImage].pause()}
        if currentImage == imageNames.count - 1 {
            currentImage = 0
        }
        else{
            currentImage += 1
        }
        swipeImageView.image = UIImage(named: imageNames[currentImage])
        let image = UIImage(named: CC_images[currentImage])!
        let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
            return image
        })
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationNames[currentImage], MPMediaItemPropertyArtist: stationNames[currentImage], MPMediaItemPropertyArtwork: artwork]
        
        audioQueues[currentImage].isMuted = false
        setOnPlay()
        //if hasBeenPaused == false {audioQueues[currentImage].play()}
        //changeStation(oldStation: oldImage, newStation: currentImage)
    }
    
    // Deinitialise the observer
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if hasBeenPaused {
            setOnPlay()
        }
        else {
            setOnPause()
        }
    }
    
    // Play and change play/pause button to pause
    func setOnPlay() {
        var items = self.toolBar.items
        for i in 0..<imageNames.count
        {
            if backgroundContinue || i == currentImage {audioQueues[i].play()}
            else {audioQueues[i].pause()}
            if i == currentImage {audioQueues[i].isMuted = false}
            else {audioQueues[i].isMuted = true}
        }
        hasBeenPaused = false
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        items![0].tintColor = UIColor.white
        self.toolBar.setItems(items, animated: true)
    }
    
    
    // Pause and change play/pause button to play
    func setOnPause() {
        var items = self.toolBar.items
        for i in 0..<imageNames.count
        {
            audioQueues[i].pause()
        }
        hasBeenPaused = true
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        items![0].tintColor = UIColor.white
        self.toolBar.setItems(items, animated: true)
    }
    
    // Pause, reshuffle playlist and play again
    @IBAction func restart(_ sender: Any) {
        audioQueues[currentImage].pause()
        if currentImage == 0 {audioQueues[currentImage] = KDST()}
        else if currentImage == 1 {audioQueues[currentImage] = LSRR()}
        else {audioQueues[currentImage] = BCTR()}
        setOnPlay()
        hasBeenPaused = false
    }
    
    // Skip file, NOT song -- could work on this in future
    @IBAction func skip(_ sender: Any) {
        audioQueues[currentImage].advanceToNextItem()
    }
    
    
    // So we can use media buttons on lock screen, command centre, headphones, Apple Watch etc.
    private func setupCommandCenter() {
        let image = UIImage(named: CC_images[currentImage])!
        let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
            return image
        })
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationNames[currentImage], MPMediaItemPropertyArtist: stationNames[currentImage], MPMediaItemPropertyArtwork: artwork]
        
        audioQueues[currentImage].allowsExternalPlayback = false
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.previousTrackCommand.isEnabled = true
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.setOnPlay()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.setOnPause()
            return .success
        }
        commandCenter.previousTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.restart(UIButton())
            return .success
        }
        commandCenter.nextTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            // self?.skip(UIButton())
            
            self?.swipeLeft()
            
            return .success
        }
    }
}
