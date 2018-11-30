//
//  messageListViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/26.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class messageListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var messageList: UITableView!
    var messageArray:Array = [(date: String, message: String)]()
    

    var cellImageView: UIImageView! = UIImageView()
    var cellDateLabel: UILabel! = UILabel()
    var cellMessageLabel: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageList.delegate = self
        messageList.dataSource = self
        messageList.rowHeight = 78.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Userdefaultsからデータの取り出し
        if let loadData = UserDefaults.standard.object(forKey: "messageData") as? [[String:Any]]  {
            messageArray = loadData.map { (date: $0["date"] as! String, message: $0["message"] as! String) }
        }
        messageList.reloadData()
    }
    
    
    @IBAction func backToHeartClock(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        

        cellDateLabel = (cell.contentView.viewWithTag(1) as! UILabel)
        
        cellMessageLabel = (cell.contentView.viewWithTag(2) as! UILabel)
        
        //ラベルにデータを表示する
        cellDateLabel?.text = messageArray[indexPath.row].date
        cellMessageLabel?.text = messageArray[indexPath.row].message
        
        let lineSpaceStyle = NSMutableParagraphStyle()
        lineSpaceStyle.lineSpacing = 6.0
        let lineSpaceAttr = [NSAttributedString.Key.paragraphStyle: lineSpaceStyle]
        cellMessageLabel.attributedText = NSMutableAttributedString(string: cellMessageLabel.text!, attributes: lineSpaceAttr)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //もしセルの編集モードがeditingStyleなら、セルと要素を削除します
        if editingStyle == .delete {
            //選択したセルに入っている要素（indexpath.row番目）を削除します
            messageArray.remove(at: indexPath.row)
            messageList.deleteRows(at: [indexPath], with: .fade)
            
            let saveData:[[String: Any]] = messageArray.map{["date": $0.date, "message": $0.message]}
            
            UserDefaults.standard.set(saveData, forKey: "messageData")
        }
        
    }
    
}
