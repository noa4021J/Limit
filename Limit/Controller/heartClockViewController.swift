//
//  heartClockViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/24.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit
import WaveAnimationView
import HeartLoadingView
import UserNotifications

class heartClockViewController: UIViewController,UNUserNotificationCenterDelegate {

    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var limitYearLabel: UILabel!
    @IBOutlet weak var limitMonthLabel: UILabel!
    @IBOutlet weak var limitDayLabel: UILabel!
    @IBOutlet weak var limitHourLabel: UILabel!
    @IBOutlet weak var limitMinuteLabel: UILabel!
    @IBOutlet weak var limitSecondLabel: UILabel!
    
    @IBOutlet weak var topicDateLabel: UILabel!
    @IBOutlet weak var topicMessageLabel: UILabel!
    @IBOutlet weak var cornerView: UIView!
    
    let heartLoadingView = HeartLoadingView()
    
    var percentage:Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        cornerView.layer.cornerRadius = 40
        cornerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        heartLoadingView.heartAmplitude = 10.0
        heartLoadingView.isAnimated = true
        
        view.addSubview(heartLoadingView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calculationYMD()
        
        heartLoadingView.progress = calculationYMD()
        heartLoadingView.isShowProgressText = true
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeUpdater), userInfo: nil, repeats: true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }

    
    func calculationYMD() -> Double {
//
//        let nowDate = Date()
//        let birthdayDate = UserDefaults.standard.object(forKey: "birthday") as! Date
//        var deadDate:Int!
//        var userSex:String = ""
//        var userAge:Int!
//
//        var calendar = Calendar.current
//        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
//        calendar.locale = Locale(identifier: "ja")
        
//        userSex = UserDefaults.standard.object(forKey: "sex") as! String
//        userAge = UserDefaults.standard.object(forKey: "age") as! Int
//
        if userSex == "male" {
            
            switch userAge {
            case 1...3: break
            case 4...5: break
            }
            
            switch userAge {
            case 1...21:
                deadDate = 81
            case 0:
                deadDate = 82
            case 2:
                deadDate = 81
            case 3:
                deadDate = 81
            case 4:
                deadDate = 81
            case 5:
                deadDate = 81
            case 6:
                deadDate = 81
            case 7:
                deadDate = 81
            case 8:
                deadDate = 81
            case 9:
                deadDate = 81
            case 10:
                deadDate = 81
            case 11:
                deadDate = 81
            case 12:
                deadDate = 81
            case 13:
                deadDate = 81
            case 14:
                deadDate = 81
            case 15:
                deadDate = 81
            case 16:
                deadDate = 81
            case 17:
                deadDate = 81
            case 18:
                deadDate = 81
            case 19:
                deadDate = 81
            case 20:
                deadDate = 81
            case 21:
                deadDate = 81
            case 22:
                deadDate = 82
            case 23:
                deadDate = 82
            case 24:
                deadDate = 82
            case 25:
                deadDate = 82
            case 26:
                deadDate = 82
            case 27:
                deadDate = 82
            case 28:
                deadDate = 82
            case 29:
                deadDate = 82
            case 30:
                deadDate = 82
            case 31:
                deadDate = 82
            case 32:
                deadDate = 82
            case 33:
                deadDate = 82
            case 34:
                deadDate = 82
            case 35:
                deadDate = 82
            case 36:
                deadDate = 82
            case 37:
                deadDate = 82
            case 38:
                deadDate = 82
            case 39:
                deadDate = 82
            case 40:
                deadDate = 82
            case 41:
                deadDate = 82
            case 42:
                deadDate = 82
            case 43:
                deadDate = 82
            case 44:
                deadDate = 82
            case 45:
                deadDate = 82
            case 46:
                deadDate = 82
            case 47:
                deadDate = 82
            case 48:
                deadDate = 82
            case 49:
                deadDate = 83
            case 50:
                deadDate = 83
            case 51:
                deadDate = 83
            case 52:
                deadDate = 83
            case 53:
                deadDate = 83
            case 54:
                deadDate = 83
            case 55:
                deadDate = 83
            case 56:
                deadDate = 83
            case 57:
                deadDate = 83
            case 58:
                deadDate = 83
            case 59:
                deadDate = 84
            case 60:
                deadDate = 84
            case 61:
                deadDate = 84
            case 62:
                deadDate = 84
            case 63:
                deadDate = 84
            case 64:
                deadDate = 84
            case 65:
                deadDate = 85
            case 66:
                deadDate = 85
            case 67:
                deadDate = 85
            case 68:
                deadDate = 85
            case 69:
                deadDate = 85
            case 70:
                deadDate = 86
            case 71:
                deadDate = 86
            case 72:
                deadDate = 86
            case 73:
                deadDate = 87
            case 74:
                deadDate = 87
            case 75:
                deadDate = 87
            case 76:
                deadDate = 88
            case 77:
                deadDate = 88
            case 78:
                deadDate = 88
            case 79:
                deadDate = 89
            case 80:
                deadDate = 89
            case 81:
                deadDate = 89
            case 82:
                deadDate = 90
            case 83:
                deadDate = 90
            case 84:
                deadDate = 91
            case 85:
                deadDate = 91
            case 86:
                deadDate = 92
            case 87:
                deadDate = 92
            case 88:
                deadDate = 93
            case 89:
                deadDate = 94
            case 90:
                deadDate = 94
            case 91:
                deadDate = 95
            case 92:
                deadDate = 96
            case 93:
                deadDate = 96
            case 94:
                deadDate = 97
            case 95:
                deadDate = 98
            case 96:
                deadDate = 98
            case 97:
                deadDate = 99
            case 98:
                deadDate = 100
            case 99:
                deadDate = 101
            case 100:
                deadDate = 102
            case 101:
                deadDate = 103
            case 102:
                deadDate = 104
            case 103:
                deadDate = 104
            case 104:
                deadDate = 105
            case 105:
                deadDate = 106
            default:
                break
            }
            
        } else if userSex == "female" {
         
             switch userAge {
             case 0:
             deadDate = 87
             case 1:
             deadDate = 87
             case 2:
             deadDate = 87
             case 3:
             deadDate = 87
             case 4:
             deadDate = 87
             case 5:
             deadDate = 87
             case 6:
             deadDate = 87
             case 7:
             deadDate = 87
             case 8:
             deadDate = 87
             case 9:
             deadDate = 88
             case 10:
             deadDate = 88
             case 11:
             deadDate = 88
             case 12:
             deadDate = 88
             case 13:
             deadDate = 88
             case 14:
             deadDate = 88
             case 15:
             deadDate = 88
             case 16:
             deadDate = 88
             case 17:
             deadDate = 88
             case 18:
             deadDate = 88
             case 19:
             deadDate = 88
             case 20:
             deadDate = 88
             case 21:
             deadDate = 88
             case 22:
             deadDate = 88
             case 23:
             deadDate = 88
             case 24:
             deadDate = 88
             case 25:
             deadDate = 88
             case 26:
             deadDate = 88
             case 27:
             deadDate = 88
             case 28:
             deadDate = 88
             case 29:
             deadDate = 88
             case 30:
             deadDate = 88
             case 31:
             deadDate = 88
             case 32:
             deadDate = 88
             case 33:
             deadDate = 88
             case 34:
             deadDate = 88
             case 35:
             deadDate = 88
             case 36:
             deadDate = 88
             case 37:
             deadDate = 88
             case 38:
             deadDate = 88
             case 39:
             deadDate = 88
             case 40:
             deadDate = 88
             case 41:
             deadDate = 88
             case 42:
             deadDate = 88
             case 43:
             deadDate = 88
             case 44:
             deadDate = 88
             case 45:
             deadDate = 88
             case 46:
             deadDate = 88
             case 47:
             deadDate = 88
             case 48:
             deadDate = 88
             case 49:
             deadDate = 88
             case 50:
             deadDate = 88
             case 51:
             deadDate = 88
             case 52:
             deadDate = 88
             case 53:
             deadDate = 88
             case 54:
             deadDate = 89
             case 55:
             deadDate = 89
             case 56:
             deadDate = 89
             case 57:
             deadDate = 89
             case 58:
             deadDate = 89
             case 59:
             deadDate = 89
             case 60:
             deadDate = 89
             case 61:
             deadDate = 89
             case 62:
             deadDate = 89
             case 63:
             deadDate = 89
             case 64:
             deadDate = 89
             case 65:
             deadDate = 89
             case 66:
             deadDate = 90
             case 67:
             deadDate = 90
             case 68:
             deadDate = 90
             case 69:
             deadDate = 90
             case 70:
             deadDate = 90
             case 71:
             deadDate = 90
             case 72:
             deadDate = 90
             case 73:
             deadDate = 90
             case 74:
             deadDate = 91
             case 75:
             deadDate = 91
             case 76:
             deadDate = 91
             case 77:
             deadDate = 91
             case 78:
             deadDate = 91
             case 79:
             deadDate = 92
             case 80:
             deadDate = 92
             case 81:
             deadDate = 92
             case 82:
             deadDate = 92
             case 83:
             deadDate = 93
             case 84:
             deadDate = 93
             case 85:
             deadDate = 93
             case 86:
             deadDate = 94
             case 87:
             deadDate = 94
             case 88:
             deadDate = 95
             case 89:
             deadDate = 95
             case 90:
             deadDate = 96
             case 91:
             deadDate = 96
             case 92:
             deadDate = 97
             case 93:
             deadDate = 97
             case 94:
             deadDate = 98
             case 95:
             deadDate = 99
             case 96:
             deadDate = 99
             case 97:
             deadDate = 100
             case 98:
             deadDate = 101
             case 99:
             deadDate = 102
             case 100:
             deadDate = 102
             case 101:
             deadDate = 103
             case 102:
             deadDate = 104
             case 103:
             deadDate = 105
             case 104:
             deadDate = 106
             case 105:
             deadDate = 107
             default:
             break
         }
        } else {
            
        }
        
        let limitCalendar = Calendar.current
        var limitCompornets = limitCalendar
            .dateComponents([.year, .month, .day,
                             .hour, .minute, .second,
                             .nanosecond],
                            from: birthdayDate)
        limitCompornets.year = limitCompornets.year! + deadDate
        
        
        //寿命
        let limitDate = limitCalendar.date(from: limitCompornets)
        
        

        
        
        //寿命までの年月日
        let dayComponents = calendar.dateComponents([.year, .month, .day],
                                                 from: nowDate,
                                                 to: limitDate!)
        //寿命までの日数
        let totalDaysComponents = calendar.dateComponents([.day],
                                                               from: nowDate,
                                                               to: limitDate!)
        
        //生年月日から数えた寿命までの日数
        let allDaysComponents = calendar.dateComponents([.day],
                                                          from: birthdayDate,
                                                          to: limitDate!)
        
        //余命までの日数
        let limitYear = dayComponents.year!
        let limitMonth = dayComponents.month!
        let limitDay =  dayComponents.day!
        let totalDays = totalDaysComponents.day!
        let allDays = allDaysComponents.day!
        
        limitYearLabel.text = String(limitYear)
        limitMonthLabel.text = String(limitMonth)
        limitDayLabel.text = String(limitDay)
        totalDaysLabel.text = String(totalDays)
        
        percentage = Double(totalDays) / Double(allDays)
        
        return percentage
    }
    
    @objc func timeUpdater(){
        
        let nowDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: nowDate)
        let minute = calendar.component(.minute, from: nowDate)
        let second = calendar.component(.second, from: nowDate)
        
        let limitHour = 24 - hour
        let limitMinute = 60 - minute
        let limitSecond = 60 - second
        
        limitHourLabel.text = String(limitHour)
        limitMinuteLabel.text = String(limitMinute)
        limitSecondLabel.text = String(limitSecond)
        
    }
    
    
    
}

//余命までの年月日＝平均寿命までの日数-現在まで過ごした日数（経過日数passTime）
//1日が終わるまでのカウントダウン＝24時間-現在の時間：60分-現在の分：60秒-現在の秒
//経過日数＝今日の日付-生年月日
//寿命%＝余命/平均寿命*100
