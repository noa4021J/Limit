//
//  settingViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/26.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit
import Eureka

class settingViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("設定")
                <<< SwitchRow("notificationSwitch"){ row in
                    row.title = "通知設定"
                    row.value = UserDefaults.standard.bool(forKey: "notificationsSwitch")
                    }.onChange({ row in
                        UserDefaults.standard.set(row.value!, forKey: "notificationsSwitch")
                        row.updateCell()
        })
        
        }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
}
