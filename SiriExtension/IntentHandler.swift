//
//  IntentHandler.swift
//  SiriExtension
//
//  Created by Alexander Titterton on 17/02/2019.
//  Copyright © 2019 Alexander Titterton. All rights reserved.
//

import Intents


class IntentHandler: INExtension {
        
    override func handler(for intent: INIntent) -> Any {
        guard intent is INPlayMediaIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        
        print("trying")
        
        return PlayMediaIntentHandler()
    }
    
}

public class PlayMediaIntentHandler: INExtension, INPlayMediaIntentHandling {
    
    /// - Tag: handle_extension
    public func handle(intent: INPlayMediaIntent, completion: @escaping (INPlayMediaIntentResponse) -> Void) {
        /*
         Media playback should start in the main app because the app extension's life span is short.
         
         For audio content, respond with the `.handleInApp` response code to have the system launch
         the main app in the background and call `application(_:, handle:, completionHandler:)` on
         the `UIApplicationDelegate`. This is the app's opportunity to play the audio in the background
         without the user needing to use the app directly.
         
         For video content, respond with the `.continueInApp` response code. This launches the main
         app in the foreground, and calls the `UIApplicationDelegate` method
         `application(_, continue:, restorationHandler:)`.
         */
        let response = INPlayMediaIntentResponse(code: .handleInApp, userActivity: nil)
        completion(response)
    }
}
