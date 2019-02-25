//
//  RadioPlaybackManager.swift
//  RadioKit
//
//  Created by Alexander Titterton on 18/02/2019.
//  Copyright © 2019 Alexander Titterton. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit
import MediaPlayer

public class RadioPlaybackManager: NSObject {
    
    public static let shared = RadioPlaybackManager()
    
    public var commandCentreIsSetup = false
    
    public var backgroundContinue = false
    public var hasBeenPaused = true
    
    var timeSinceSync: Double = 0
    
    var timeObserver: Any?
    
    let images = ["K-DST": UIImage(named: "images/Icon-256.png"),
                         "LSRR": UIImage(named: "images/LSRR.png"),
                         "BCTR": UIImage(named: "images/BCTR.png")]
    
    let CC_images = ["K-DST": UIImage(named: "images/KDST_CC.jpg"),
                     "LSRR": UIImage(named: "images/LSRR_CC.jpg"),
                     "BCTR": UIImage(named: "images/BCTR_CC.png")]
    
    var stations = [KDST(), LSRR(), BCTR()]
    
    var stationIndices = ["K-DST": 0,
                    "LSRR": 1,
                    "BCTR": 2]
    
    let stationNames = ["K-DST", "LSRR", "BCTR"]
    
    let stationTitles = ["K-DST": "K-DST",
                         "LSRR": "Los Santos Rock Radio",
                         "BCTR": "Blaine County Talk Radio"]
    
    var currentStation = "K-DST"
    
    func prepareSongAndSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                try audioSession.setActive(true)
                if !RadioPlaybackManager.shared.commandCentreIsSetup {RadioPlaybackManager.shared.setupCommandCenter()}
            } catch let sessionError {
                print(sessionError)
            }
        }
    }
    
    // Current station artwork for viewController
    public func currentImage() -> UIImage {
        let image = images[currentStation]!
        return image!
    }
    
    // Control Centre artwork for current station
    public func currentCCImage() -> UIImage {
        let image = CC_images[currentStation]!
        return image!
    }
    
    //let audioSession = AVAudioSession.sharedInstance()
    
    
    public func chooseStation(for station: String, fromSiri: Bool = false) {
        
        let tmp_paused = hasBeenPaused
        setOnPause()
        
        currentStation = station
        
        // Only play if already playing or if Siri requests a station
        if (tmp_paused == false) || (fromSiri == true)
        {
            setOnPlay()
        }
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
        
        NotificationCenter.default.post(name: .MPMusicPlayerControllerNowPlayingItemDidChange, object: self)
    }
    
    public func nextStation() {
        var newStation: String
        
        if currentStation == "K-DST" { newStation = "LSRR"}
        else if currentStation == "LSRR" { newStation = "BCTR"}
        else { newStation = "K-DST"}
        
        chooseStation(for: newStation)
    }
    
    public func prevStation() {
        var newStation: String
        
        if currentStation == "K-DST" { newStation = "BCTR"}
        else if currentStation == "LSRR" { newStation = "K-DST"}
        else { newStation = "LSRR"}
        
        chooseStation(for: newStation)
    }
    
    // Play and change play/pause button to pause
    public func setOnPlay() {
        
        prepareSongAndSession()

        for station in self.stationNames
        {
            if station == currentStation {stations[stationIndices[station]!].play()}
            else {stations[stationIndices[station]!].pause()}
            if station == currentStation {stations[stationIndices[station]!].isMuted = false}
            else {stations[stationIndices[station]!].isMuted = true}
        }
        
        if backgroundContinue == true
        {
            self.timeObserver = stations[stationIndices[currentStation]!].addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, 1), queue: DispatchQueue.main) {
                (CMTime) -> Void in
                
                self.timeSinceSync += 1
            }
        }
        
        hasBeenPaused = false
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
        
        NotificationCenter.default.post(name: .MPMusicPlayerControllerPlaybackStateDidChange, object: self)
    }
    
    
    // Pause and change play/pause button to play
    public func setOnPause() {
        for station in stationNames
        {
            stations[stationIndices[station]!].pause()
        }
        hasBeenPaused = true
        
        if let token = self.timeObserver
        {
            stations[stationIndices[currentStation]!].removeTimeObserver(token)
            self.timeObserver = nil
        }
        
        // Update background stations if appropriate
        if self.backgroundContinue
        {
            updateBackgroundStations()
        }
        
        NotificationCenter.default.post(name: .MPMusicPlayerControllerPlaybackStateDidChange, object: self)
    }
    
    // Re-jig the order
    public func restart() {
        setOnPause()
        
        if currentStation == "K-DST" {stations[stationIndices[currentStation]!] = KDST()}
        else if currentStation == "LSRR" {stations[stationIndices[currentStation]!] = LSRR()}
        else {stations[stationIndices[currentStation]!] = BCTR()}
        
        setOnPlay()
        hasBeenPaused = false
    }
    
    public func skip() {
        stations[stationIndices[currentStation]!].advanceToNextItem()
    }
    
    func updateBackgroundStations() {
        for station in stationNames
        {
            if station != currentStation
            {
                var tmp_timeSinceSync = self.timeSinceSync
                
                var timeLeftOnItem = (stations[stationIndices[station]!].currentItem?.duration.seconds)!
                                        - stations[stationIndices[station]!].currentTime().seconds
                
                while tmp_timeSinceSync > timeLeftOnItem
                {
                    tmp_timeSinceSync -= timeLeftOnItem
                    stations[stationIndices[station]!].advanceToNextItem()
                    timeLeftOnItem = (stations[stationIndices[station]!].currentItem?.duration.seconds)!
                    
                }
                if tmp_timeSinceSync > 0 && stations[stationIndices[station]!].status == .readyToPlay
                {
                    stations[stationIndices[station]!].seek(to: CMTimeMakeWithSeconds(stations[stationIndices[station]!].currentTime().seconds + timeSinceSync, 1))
                }
            }
        }
        self.timeSinceSync = 0
    }
    
    // So we can use media buttons on lock screen, command centre, headphones, Apple Watch etc.
    public func setupCommandCenter() {
        
        commandCentreIsSetup = true
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
        
        stations[stationIndices[currentStation]!].allowsExternalPlayback = false
        
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
            self?.restart()
            return .success
        }
        commandCenter.nextTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            // self?.skip(UIButton())
            
            self?.nextStation()
            
            return .success
        }
    }
}

