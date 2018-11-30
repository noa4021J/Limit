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
    
    @IBOutlet weak var transformView: PGTransformView!
    @IBOutlet weak var title1: PGTransformLabel!
    @IBOutlet weak var okButton: PGTransformButton!
    
    let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
    
    private var transition:PGTransformTransition!
    
    private lazy var nextVC:diagnosisViewController = {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "diagnosis") as! diagnosisViewController
    }()
    
    @IBOutlet weak var ageField: UITextField!
    
    var userAge:Int = 0
    
    var pickerView: UIPickerView = UIPickerView()
    var list:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitionSetUp()
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func tappedOK(_ sender: Any) {
        
        if ageField.text != "" {
            
            //userdefaultsに保存して次へ
            UserDefaults.standard.set(userAge, forKey: "age")
            
            self.transition.presentTransformViewController()
            
        } else {
            //アラートを出す
            let title = "入力されていません。"
            let message = "年齢を入力してください。"
            let okText = "OK"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
            present(alert, animated: true, completion: nil)
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

extension ageSelectViewController {
    
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
        
        okButton
            .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.zero, start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
    }
    
}
