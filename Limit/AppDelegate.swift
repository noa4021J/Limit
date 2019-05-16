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

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        //通知設定がONなら通知を出す
        //OFFなら通知は出さない
        
        if UserDefaults.standard.bool(forKey: "notificationsSwitch") == true {
            
            //　通知設定に必要なクラスをインスタンス化
            let trigger: UNNotificationTrigger
            let content = UNMutableNotificationContent()
            var notificationTime = DateComponents()
            
            var messageArray:Array = [(date: String, message: String)]()
            
            //メッセージデータの取り出し
            if let loadData = UserDefaults.standard.object(forKey: "messageData") as? [[String:Any]]  {
                messageArray = loadData.map { (date: $0["date"] as! String, message: $0["message"] as! String) }
            }
            
            //メッセージがあれば、通知を出す
            //メッセージがまだなければ、通知は出さない
            if messageArray.isEmpty == false {
                
                //通知を出す
                
                //通知に表示するメッセージの番号をランダムに決める
                let num = Int(arc4random_uniform(UInt32(messageArray.count)))
                
                //ランダムに決めた番号のメッセージを通知に表示する
                content.body = messageArray[num].message
                content.sound = UNNotificationSound.default
                
                // トリガー設定
                notificationTime.hour = 8
                notificationTime.minute = 0
                trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
                
                // 通知スタイルを指定
                let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
                // 通知をセット
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                
            } else {
                //何もしない
            }
            
        } else {
            //何もしない
        }
        
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

