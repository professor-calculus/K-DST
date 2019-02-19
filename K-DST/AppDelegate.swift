//
//  AppDelegate.swift
//  K-DST
//
//  Created by Alexander Titterton on 20/03/2018.
//  Copyright © 2018 Alexander Titterton. All rights reserved.
//

import UIKit
import Intents
import RadioKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var radioManager: RadioPlaybackManager?
    
    
    // Opens normally, i.e. when tapping on the app from home screen
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        print("Launched")
        application.isIdleTimerDisabled = true
        return true
    }
    
    // For Siri
    func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Void) {
        
        guard let mediaIntent = intent as? INPlayMediaIntent,
            let station = mediaIntent.mediaItems?[0].title
            else {
                completionHandler(INPlayMediaIntentResponse(code: .failure, userActivity: nil))
                return
        }
        
        // Choose the station as requested and start playing
        RadioPlaybackManager.shared.chooseStation(for: station)
        
        let response = INPlayMediaIntentResponse(code: .success, userActivity: nil)
        completionHandler(response)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

