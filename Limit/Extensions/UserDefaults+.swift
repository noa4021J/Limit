//
//  UserDefaults+.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/17.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setColorTheme(_ value: ColorTheme?, forkey: String) {
        if let setValue = value {
            self.set(setValue.rawValue, forKey: forkey)
        } else {
            removeSuite(named: forkey)
        }
    }
    
    func getColorTheme(forkey: String) -> ColorTheme? {
        if let rawValueKey = string(forKey: forkey) {
            return ColorTheme(rawValue: rawValueKey)
        }
        return nil
    }
    
}
