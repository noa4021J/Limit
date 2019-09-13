//
//  UserInfoDatasouce.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation

public class UserInfoDataSouce: NSObject {
    
    public static let shared = UserInfoDataSouce()
    
    private var sexInput: Bool?
    private var ageInput: Int?
    private var dateInput: Date?
    
    public func setMale(sex: SexParams) {
        sexInput = sex.key
    }
    
    public func setBirthday(date: Date) {
        dateInput = date
    }
    
    public func setAge(age: Int) {
        ageInput = age
    }
    
    public func getUserInfo() -> UserInfo? {
        guard let data = UserDefaults.standard.data(forKey: "UserInfo") else {
            return nil
        }
        
        NSKeyedUnarchiver.setClass(UserInfo.self, forClassName: "Limit.UserInfo")
        let userInfo = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UserInfo
        
        return userInfo
    }
    
    public func saveUserInfo(completion:()->Void) {
        
        let data = UserInfo(sex: sexInput!, age: ageInput!, birthday: dateInput!)
        
        NSKeyedArchiver.setClassName("Limit.UserInfo", for: UserInfo.self)
        let archiveData = try! NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
        
        UserDefaults.standard.set(archiveData, forKey: "UserInfo")
        UserDefaults.standard.synchronize()
        completion()
    }
    
    public func resetUserInfo() {
        
        if UserDefaults.standard.data(forKey: "UserInfo") == nil,
            UserDefaults.standard.bool(forKey: "diagnosis_finished") != true {
            return
        }
        
        UserDefaults.standard.removeObject(forKey: "UserInfo")
        UserDefaults.standard.set(false, forKey: "diagnosis_finished")
        
    }
    
}
