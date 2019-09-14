//
//  ContactViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/17.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit
import SVProgressHUD

class ContactViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var inputUserName: UITextField!
    @IBOutlet weak var inputMailAddress: UITextField!
    @IBOutlet weak var inputMessage: UITextView!
    
    private let mailer = MailerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIs()
        
    }
    
    
    private func setupUIs() {
        
        // SubmitButton
        let layer = self.setupGradientLayer(colorThemeType: ColorTheme.NearMoon, size: submitButton.bounds.size)
        layer.cornerRadius = submitButton.bounds.midY
        submitButton.layer.insertSublayer(layer, at: 0)
        
        submitButton.layer.shadowColor = UIColor(hexcode: ColorTheme.NearMoon.hexCodeSet.0, alpha: 1).cgColor
        submitButton.layer.shadowRadius = 6
        submitButton.layer.shadowOffset = CGSize(width: 0, height: 7)
        submitButton.layer.shadowOpacity = 0.8
        
        // InputMessageTextView
        inputMessage.placeholder = "お問い合わせ内容*"
        
    }
    
    @IBAction func pushSubmit(_ sender: UIButton) {
        
        let contents = mailer.validateInputContents(
            name: inputUserName.text!,
            email: inputMailAddress.text!,
            content: inputMessage.text) { (error) in
                let alert = self.generateAlertController(
                    title: error.message.title,
                    message: error.message.content,
                    actions: [
                        UIAlertAction(title: "OK", style: .default, handler: nil)
                    ]
                )
                self.present(alert, animated: true, completion: nil)
                return
        }
        
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action) in
            return
        })
        
        let okey = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            SVProgressHUD.show(withStatus: "送信中...")
            
            self.mailer.sendContents(contents: contents!, completion: { (finished, error) in
                if error != nil {
                    SVProgressHUD.showError(withStatus: "送信に失敗しました。")
                }
                SVProgressHUD.showSuccess(withStatus: "送信が完了しました！")
            })
            
        })
        
        let alert = self.generateAlertController(
            title: "この内容で送信します",
            message: "よろしければOKボタンを押してください。",
            actions: [cancel,okey]
        )
        
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func pushClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: TableViewHeaderとNavigationBarのスペース調整。もっといい方法ない？
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

}
