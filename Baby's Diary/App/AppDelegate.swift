//
//  AppDelegate.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 18/06/2024.
//

import UIKit
import FirebaseCore
import Firebase
import FirebaseAppCheck

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureFirebase()
        return true
    }
    
    func configureFirebase() {
        FirebaseApp.configure()

//        #if targetEnvironment(simulator)
//        // Disable App Check for Simulator
//        AppCheck.setAppCheckProviderFactory(nil)
//        #else
//        // Use default App Check provider
//        AppCheck.setAppCheckProviderFactory(AppCheckDebugProviderFactory())
//        #endif
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

