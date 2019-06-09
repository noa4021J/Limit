//
//  AppDelegate.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/24.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sleep(2)
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        
        if UserDefaults.standard.bool(forKey: "diagnosis_finished") {
            window = UIWindow(frame: UIScreen.main.bounds)
            window!.rootViewController = storybord.instantiateViewController(withIdentifier: "clockView")
            window!.makeKeyAndVisible()
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window!.rootViewController = storybord.instantiateViewController(withIdentifier: "rootView")
            window!.makeKeyAndVisible()
        }
        
        return true
    }


}

