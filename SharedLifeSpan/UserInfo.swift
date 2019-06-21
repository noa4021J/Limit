//
//  UserInfo.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation

@objc(UserInfo)
public class UserInfo: NSObject, NSCoding {
    
    var sex: Bool
    var age: Int
    var birthday: Date
    
    init(sex: Bool, age: Int, birthday: Date) {
        self.sex = sex
        self.age = age
        self.birthday = birthday
    }
    
    required public init?(coder aDecoder: NSCoder) {
        sex = aDecoder.decodeBool(forKey: "UserSex")
        age = aDecoder.decodeInteger(forKey: "UserAge")
        birthday = aDecoder.decodeObject(forKey: "Birthday") as! Date
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(sex, forKey: "UserSex")
        aCoder.encode(age, forKey: "UserAge")
        aCoder.encode(birthday, forKey: "Birthday")
    }

}

public enum SexParams {
    
    case male
    case female
    
    var key: Bool {
        switch self {
        case .male:
            return true
        case .female:
            return false
        }
    }
    
}
