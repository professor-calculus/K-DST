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
    
    // For when Siri requests a given station, whether we're already playing something or not
    public func chooseStation(for station: String) {
        currentStation = station
        setOnPlay()
    }
    
    public func nextStation() {
        var newStation: String
        
        if currentStation == "K-DST" { newStation = "LSRR"}
        else if currentStation == "LSRR" { newStation = "BCTR"}
        else { newStation = "K-DST"}
        
        if hasBeenPaused == false
        {
            stations[stationIndices[currentStation]!].isMuted = true
            stations[stationIndices[newStation]!].isMuted = false
            stations[stationIndices[newStation]!].play()
            if backgroundContinue == false {stations[stationIndices[currentStation]!].pause()}
        }
        
        currentStation = newStation
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
    }
    
    public func prevStation() {
        var newStation: String
        
        if currentStation == "K-DST" { newStation = "BCTR"}
        else if currentStation == "LSRR" { newStation = "K-DST"}
        else { newStation = "LSRR"}
        
        if hasBeenPaused == false
        {
            stations[stationIndices[currentStation]!].isMuted = true
            stations[stationIndices[newStation]!].isMuted = false
            stations[stationIndices[newStation]!].play()
            if backgroundContinue == false {stations[stationIndices[currentStation]!].pause()}
        }
        
        currentStation = newStation
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
    }
    
    // Play and change play/pause button to pause
    public func setOnPlay() {
        
        prepareSongAndSession()

        for station in self.stationNames
        {
            if backgroundContinue || station == currentStation {stations[stationIndices[station]!].play()}
            else {stations[stationIndices[station]!].pause()}
            if station == currentStation {stations[stationIndices[station]!].isMuted = false}
            else {stations[stationIndices[station]!].isMuted = true}
        }
        hasBeenPaused = false
        
        let image = CC_images[currentStation]!
        let artwork = MPMediaItemArtwork.init(boundsSize: image!.size, requestHandler: { (size) -> UIImage in
            return image!
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: stationTitles[currentStation]!, MPMediaItemPropertyArtist: stationTitles[currentStation]!, MPMediaItemPropertyArtwork: artwork]
    }
    
    
    // Pause and change play/pause button to play
    public func setOnPause() {
        for station in stationNames
        {
            stations[stationIndices[station]!].pause()
        }
        hasBeenPaused = true
    }
    
    // Re-jig the order
    public func restart() {
        stations[stationIndices[currentStation]!].pause()
        
        if currentStation == "K-DST" {stations[stationIndices[currentStation]!] = KDST()}
        else if currentStation == "LSRR" {stations[stationIndices[currentStation]!] = LSRR()}
        else {stations[stationIndices[currentStation]!] = BCTR()}
        
        setOnPlay()
        hasBeenPaused = false
    }
    
    public func skip() {
        stations[stationIndices[currentStation]!].advanceToNextItem()
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
