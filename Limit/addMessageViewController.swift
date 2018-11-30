//
//  addMessageViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/26.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class addMessageViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var nowStringCount: UILabel!
    var messageArray:Array = [(date: String, message: String)]()
    var nowTime = Date()
    let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        messageTextView.delegate = self
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードが出ている状態なら...
        if messageTextView.isFirstResponder {
            //キーボードを閉じる
            messageTextView.resignFirstResponder()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
    
        let messageCount: String = messageTextView.text // 文字列をあらかじめ取得しておく
        if messageTextView.text.count > 45 { // 10000字を超えた時
            // 以下，範囲指定する
            let start = messageCount.index(messageCount.startIndex, offsetBy: 0)
            let end = messageCount.index(messageCount.startIndex, offsetBy: 44)
            messageTextView.text = String(messageCount[start...end])
        }
        
        let count = messageTextView.text.count
        nowStringCount.text = "現在\(count)文字です"
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let count = messageTextView.text.count
        let remaining = 45 - count
        
        if remaining >= 0{
            nowStringCount.text = "残り\(remaining)文字です"
        } else {
            nowStringCount.text = "45文字以下にしてください"
        }
        
        
    }
    
    
    @IBAction func tapEntry(_ sender: Any) {
        //入力されているテキストと今日の日付をUserdefaultsに登録する
        
        formatter.dateFormat = "yyyy年M月d日"
        let postDate = formatter.string(from: nowTime as Date)
        
        //現在の配列をUserdefaultsから取り出して配列に変換→取得
        if UserDefaults.standard.object(forKey: "messageData") != nil {
            
            let loadData = UserDefaults.standard.object(forKey: "messageData") as! [[String:Any]]
            
            messageArray = loadData.map{(date: $0["date"] as! String, message: $0["message"] as! String)}
        }
        
        messageArray.append((date: postDate, message: messageTextView.text))
        
        //messageArrayをdictionary型に変換してUserdefaultsに保存
        let saveData:[[String: Any]] = messageArray.map{["date": $0.date, "message": $0.message]}
        
        UserDefaults.standard.set(saveData, forKey: "messageData")
        
        //textFieldを空にする
        messageTextView.text = ""
        
        //キーボードが出ている状態なら...
        if messageTextView.isFirstResponder {
            //キーボードを閉じる
            messageTextView.resignFirstResponder()
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backToHeartClock(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
