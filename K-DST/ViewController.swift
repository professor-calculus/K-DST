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
    
    //var songPlayer = AVAudioPlayer()
    
    var audioQueue = Playlist()
    
    var hasBeenPaused = true
    
    func prepareSongAndSession() {
        do {
            //songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "K-DST", ofType: "mp3")!))
            //songPlayer.prepareToPlay()
            
            var audioQueue = Playlist()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                try audioSession.setActive(true)
                UIApplication.shared.beginReceivingRemoteControlEvents()
                setupCommandCenter()
            } catch let sessionError {
                print(sessionError)
            }
        } catch let audioQueueError {
            print(audioQueueError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print("loading stuff")
        // Do any additional setup after loading the view, typically from a nib.
        prepareSongAndSession()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func setOnPlay() {
        var items = self.toolBar.items
        audioQueue.play()
        hasBeenPaused = false
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        items![0].tintColor = UIColor.white
        self.toolBar.setItems(items, animated: true)
    }

    func setOnPause() {
        var items = self.toolBar.items
        audioQueue.pause()
        hasBeenPaused = true
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        items![0].tintColor = UIColor.white
        self.toolBar.setItems(items, animated: true)
    }
    
    @IBAction func restart(_ sender: Any) {
        audioQueue.pause()
        audioQueue = Playlist()
        setOnPlay()
        hasBeenPaused = false
    }
    
    @IBAction func skip(_ sender: Any) {
        audioQueue.advanceToNextItem()
    }
    
    
    private func setupCommandCenter() {
        let image = UIImage(named: "icons/Icon-180.png")!
        let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
            return image
        })
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "K-DST", MPMediaItemPropertyArtist: "K-DST", MPMediaItemPropertyArtwork: artwork]
        
        audioQueue.allowsExternalPlayback = true
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.skipBackwardCommand.isEnabled = true
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.setOnPlay()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.setOnPause()
            return .success
        }
        commandCenter.skipBackwardCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.restart(UIButton())
            return .success
        }
        commandCenter.nextTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.audioQueue.advanceToNextItem()
            return .success
        }
    }
}
