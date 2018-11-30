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
    
    @IBOutlet weak var transformView: PGTransformView!
    @IBOutlet weak var title1: PGTransformLabel!
    @IBOutlet weak var okButton: UIButton!
    
    let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
    
    private var transition:PGTransformTransition!
    
    private lazy var nextVC:ageSelectViewController = {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "age") as! ageSelectViewController
    }()

    @IBOutlet weak var birthdayField: UITextField!
    
    var toolBar:UIToolbar!
    var userBirthday:Date!
    var birthdayInbox:Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitionSetUp()

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func tappedOK(_ sender: Any) {
        
        if birthdayField.text != "" {
            
            //userdefaultsに保存して次へ
            userBirthday = birthdayInbox
            UserDefaults.standard.set(userBirthday, forKey: "birthday")
            
            self.transition.presentTransformViewController()
            
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dateEditing(sender: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //キーボードが出ている状態なら...
        if birthdayField.isFirstResponder {
            //キーボードを閉じる
            birthdayField.resignFirstResponder()
        }
        
    }
    
    
    
    // 日付を入力する
    func dateEditing(sender: UITextField) {
        let datePicker = UIDatePicker()
        
        datePicker.maximumDate = NSDate() as Date
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        datePicker.backgroundColor = UIColor.white
    }
    
    // 日付を変更した際にUITextFieldに値を設定する
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "yyyy年 M月 d日";
        birthdayField.text = dateFormatter.string(from: sender.date)
        birthdayInbox = sender.date
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


extension birthdaySelectViewController {
    
    func transitionSetUp() {
        
        self.transition = PGTransformTransition.init(target: self, presenting: self.nextVC)
        
        transformView
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndAlpha(0.0, start: 0.0, duration: 1.0)
        
        title1
            .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.zero, start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
        
    }
    
}
