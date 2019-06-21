//
//  MailerService.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/18.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFunctions

class MailerService {
    
    enum MailerError {
        case contentIsEmpty
        case emailValidateError
        case sendingMailIsfailed
        
        var message: (title: String, content: String) {
            switch self {
            case .contentIsEmpty:
                let title = "未入力の項目があります"
                let content = "必須項目となっています。入力をお願いします。"
                return (title: title, content: content)
                
            case .emailValidateError:
                let title = "メールアドレスの形式が不正です"
                let content = "メールアドレスの入力に誤りがあります。修正をお願いします。"
                return (title: title, content: content)
                
            case .sendingMailIsfailed:
                let title = "送信に失敗しました"
                let content = "もう一度送信をお試しください。"
                return (title: title, content: content)
                
            }
        }
        
    }
    
    let functions = Functions.functions()
    
    func validateInputContents(name: String, email: String, content: String, errorHanlder: (_ error: MailerError)->Void) -> [String:String]? {
        
        //各フォーム内容バリデーション,nilチェック
        if name == "" || email == "" || content == "" {
            errorHanlder(MailerError.contentIsEmpty)
            return nil
        }
        
        if !isValidEmail(email) {
            errorHanlder(MailerError.emailValidateError)
            return nil
        }
        
        let contents: [String:String] = [
            "name": name,
            "email": email,
            "contents": content
        ]
        
        return contents
    }
    
    func sendContents(contents: [String:String], completion: @escaping (_ result: Bool, _ error: MailerError?) -> Void) {
        functions.httpsCallable("sendMail").call(contents) { (result, error) in
            if error != nil {
                completion(false, MailerError.sendingMailIsfailed)
            }
            completion(true, nil)
        }
    }
    
    
    private func isValidEmail(_ string: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: string)
        return result
    }
    
}


