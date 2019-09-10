//
//  AppDelegate.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/24.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Firebase SetUp
        FirebaseApp.configure()
        
        sleep(2)
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        
        if UserDefaults.standard.bool(forKey: "diagnosis_finished") {
            window = UIWindow(frame: UIScreen.main.bounds)
            window!.rootViewController = storybord.instantiateViewController(withIdentifier: "clockView")
            window!.makeKeyAndVisible()

//            //Watch Connectivity対応確認
//            if WCSession.isSupported() {
//                let session = WCSession.default
//                session.delegate = self
//                session.activate()
//            }
            
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window!.rootViewController = storybord.instantiateViewController(withIdentifier: "rootView")
            window!.makeKeyAndVisible()
        }
        
        
        
        return true
    }
    

}

