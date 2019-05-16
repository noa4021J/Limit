//
//  birthdaySelectViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import PGEZTransition

class birthdaySelectViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var birthdayField: UITextField!
    
    var toolBar:UIToolbar!
    var userBirthday:Date!
    var birthdayInbox:Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        birthdayField.layer.cornerRadius = birthdayField.frame.size.height * 0.5
        birthdayField.layer.borderWidth = 1.0
        birthdayField.layer.borderColor = UIColor.gray.cgColor
        birthdayField.borderStyle = .none
        
        //datepicker上のtoolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(doneBtn))
        toolBar.items = [toolBarBtn]
        toolBar.backgroundColor = UIColor.white
        birthdayField.inputAccessoryView = toolBar
        birthdayField.delegate = self
    }
    
    
    @IBAction func tappedOK(_ sender: Any) {
        
        if birthdayField.text != "" {
            
            //userdefaultsに保存して次へ
            userBirthday = birthdayInbox
            UserDefaults.standard.set(userBirthday, forKey: "birthday")
            
            
        } else {
            //アラートを出す
            
            let title = "入力されていません。"
            let message = "生年月日を入力してください。"
            let okText = "OK"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードが出ている状態なら...
        if birthdayField.isFirstResponder {
            //キーボードを閉じる
            birthdayField.resignFirstResponder()
        }
    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        dateEditing(sender: textField)
//    }
//
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //キーボードが出ている状態なら...
        if birthdayField.isFirstResponder {
            //キーボードを閉じる
            birthdayField.resignFirstResponder()
        }
        
    }
    
    
    
//    // 日付を入力する
//    func dateEditing(textField: UITextField) {
//        let datePicker = UIDatePicker()
//
//        datePicker.maximumDate = NSDate() as Date
//        datePicker.datePickerMode = UIDatePicker.Mode.date
//        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
//        datePicker.backgroundColor = UIColor.white
//
//        textField.inputView = datePicker
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(picker: <#T##UIDatePicker#>, textField: <#T##UITextField#>)), for: UIControl.Event.valueChanged)
//
//    }
    
    // 日付を変更した際にUITextFieldに値を設定する
    @objc func datePickerValueChanged(picker: UIDatePicker, textField: UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "yyyy年 M月 d日"
        birthdayInbox = picker.date
        textField.text = dateFormatter.string(from: picker.date)
    }
    
    //toolbarのdoneボタン
    @objc func doneBtn(){
        //キーボードが出ている状態なら...
        if birthdayField.isFirstResponder {
            //キーボードを閉じる
            birthdayField.resignFirstResponder()
        }
        
    }
    
    
    

}


