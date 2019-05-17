//
//  UserInfoDatasouce.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation

class UserInfoDataSouce {
    
    static let shared = UserInfoDataSouce()
    
    private var sexInput: Bool?
    private var ageInput: Int?
    private var dateInput: Date?
    
    func setMale(sex: SexParams) {
        sexInput = sex.key
    }
    
    func setBirthday(date: Date) {
        dateInput = date
    }
    
    func setAge(age: Int) {
        ageInput = age
    }
    
    func getUserInfo() -> UserInfo? {
        guard let data = UserDefaults.standard.data(forKey: "UserInfo"),
        let userInfo = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UserInfo else {
            return nil
        }
        return userInfo
    }
    
    func saveUserInfo(completion:()->Void) {
        let data = UserInfo(sex: sexInput!, age: ageInput!, birthday: dateInput!)
        let archiveData = try! NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
        UserDefaults.standard.set(archiveData, forKey: "UserInfo")
        UserDefaults.standard.synchronize()
        completion()
    }
    
}
