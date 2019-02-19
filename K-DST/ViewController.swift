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
import Intents
import CoreSpotlight
import CoreServices
import RadioKit

class ViewController: UIViewController {
    
    // Swipe image container
    @IBOutlet weak var swipeImageView: UIImageView!
    // Type in the names of your images below
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    @objc func defaultsChanged(){
        if UserDefaults.standard.bool(forKey: "backgroundContinue") {
            RadioPlaybackManager.shared.backgroundContinue = true
        }
        else {
            RadioPlaybackManager.shared.backgroundContinue = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == .authorized {
                print("Siri access allowed")
            } else {
                print("Siri access denied")
            }
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        swipeImageView.image = RadioPlaybackManager.shared.currentImage()

        // Do any additional setup after loading the view, typically from a nib.
        
        registerSettingsBundle()
        
        defaultsChanged()
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        // Updates key vars when app enters foreground
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updatePlayButton),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateImage),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        
        donateKDST()
        donateLSRR()
        donateBCTR()
        
    }
    
    @objc func updateImage() {
        swipeImageView.image = RadioPlaybackManager.shared.currentImage()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                RadioPlaybackManager.shared.nextStation()

            case UISwipeGestureRecognizer.Direction.right:
                RadioPlaybackManager.shared.prevStation()

            default:
                break
            }
            swipeImageView.image = RadioPlaybackManager.shared.currentImage()
        }
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
        
        if RadioPlaybackManager.shared.hasBeenPaused {
            RadioPlaybackManager.shared.setOnPlay()
        }
        else {
            RadioPlaybackManager.shared.setOnPause()
        }
        
        updatePlayButton()
    }
    
    // Pause, reshuffle playlist and play again
    @IBAction func restart(_ sender: Any) {
        RadioPlaybackManager.shared.restart()
    }
    
    // Skip file, NOT song -- could work on this in future
    @IBAction func skip(_ sender: Any) {
        RadioPlaybackManager.shared.skip()
    }
    
    @objc func updatePlayButton() {
        var items = self.toolBar.items
        if RadioPlaybackManager.shared.hasBeenPaused == true
        {
            items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        }
        else
        {
            items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.pause, target: self, action: #selector(ViewController.playButtonTapped(_:)))
        }
        
        items![0].tintColor = UIColor.white
        self.toolBar.setItems(items, animated: true)
    }
    
    func donateKDST() {
        let image = INImage(named: "icons/KDST_CC.png")
        let item = INMediaItem(identifier: "K-DST", title: "K-DST", type: .musicStation, artwork: image)
        
        let intent = INPlayMediaIntent(mediaItems: [item])
        intent.suggestedInvocationPhrase = "Play The Dust"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func donateLSRR() {
        let image = INImage(named: "icons/LSRR_CC.png")
        let item = INMediaItem(identifier: "LSRR", title: "LSRR", type: .musicStation, artwork: image)
        
        let intent = INPlayMediaIntent(mediaItems: [item])
        intent.suggestedInvocationPhrase = "Play Los Santos Rock Radio"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func donateBCTR() {
        let image = INImage(named: "icons/BCTR_CC.png")
        let item = INMediaItem(identifier: "BCTR", title: "BCTR", type: .musicStation, artwork: image)
        
        let intent = INPlayMediaIntent(mediaItems: [item])
        intent.suggestedInvocationPhrase = "Play Blaine County Radio"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
