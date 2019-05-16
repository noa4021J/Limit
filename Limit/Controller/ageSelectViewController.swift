//
//  ageSelectViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import PGEZTransition

class ageSelectViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ageField: UITextField!
    
    var userAge:Int = 0
    
    var pickerView: UIPickerView = UIPickerView()
    var list:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agePickerListCreate()
        
        ageField.layer.cornerRadius = ageField.frame.size.height * 0.5
        ageField.layer.borderWidth = 1.0
        ageField.layer.borderColor = UIColor.gray.cgColor
        ageField.borderStyle = .none
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        pickerView.backgroundColor = UIColor.white
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let OKItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(ageSelectViewController.done))
        toolbar.backgroundColor = UIColor.white
        toolbar.setItems([OKItem], animated: true)
        
        self.ageField.inputView = pickerView
        self.ageField.inputAccessoryView = toolbar
    }

    @IBAction func tappedOK(_ sender: Any) {
        
        if ageField.text != "" {
            
            //userdefaultsに保存して次へ
            UserDefaults.standard.set(userAge, forKey: "age")
            
        } else {
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードが出ている状態なら...
        if ageField.isFirstResponder {
            //キーボードを閉じる
            ageField.resignFirstResponder()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(list[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userAge = list[row]
        self.ageField.text = String(list[row])
    }
    
    @objc func done() {
        self.ageField.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    //agePickerのリストを生成
    func agePickerListCreate() {
        for i in 0..<106 {
            let num:Int = i
            list.append(num)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

