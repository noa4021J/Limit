//
//  CustomDatePicker.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class CustomDatePicker: UIDatePicker {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maximumDate = NSDate() as Date
        self.datePickerMode = UIDatePicker.Mode.date
        self.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func dateFormat(completion: @escaping (String)->Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "yyyy年 M月 d日"
        completion(dateFormatter.string(from: self.date))
    }
    
    
    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
    }
    */

}
