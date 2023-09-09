//
//  AdMobApp.swift
//  AdMob
//
//  Created by Ganesh on 09/09/23.
//

import SwiftUI
import GoogleMobileAds

class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start()
        return true
    }
}

@main
struct AdMobApp: App {
    var body: some Scene {
        WindowGroup {
            
            // 1
            //RewardAdView()
            
            // 2
            InterstitialAdView()
        }
    }
}
