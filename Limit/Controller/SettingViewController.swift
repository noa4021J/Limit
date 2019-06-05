//
//  SettingViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/05.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingView: UIView!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shareButton.layer.addSublayer(shareButton.drawSideBorder(borderWidth: 0.5, borderColor: .lightGray, UI: shareButton, side: .bottom))
        
        reviewButton.layer.addSublayer(reviewButton.drawSideBorder(borderWidth: 0.5, borderColor: .lightGray, UI: reviewButton, side: .bottom))
        
        resetButton.layer.addSublayer(resetButton.drawSideBorder(borderWidth: 0.5, borderColor: .lightGray, UI: resetButton, side: .bottom))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let tapEvent = touches.first else { return }
        
        let tapLocation = tapEvent.location(in: self.view)
        
        if !settingView.frame.contains(tapLocation) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetLifeSpan()
    }
    
    @IBAction func share(_ sender: UIButton) {
        shareLimit()
    }
    
    @IBAction func review(_ sender: UIButton) {
        openAppStore()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    private func resetLifeSpan() {
        
        let alert = UIAlertController(title: "寿命を再診断します", message: "現在の寿命をリセットし、再診断を行います。よろしいですか？", preferredStyle: UIAlertController.Style.alert)
        
        let okayButton = UIAlertAction(title: "OK", style: .default) { (action) in
            
            UserInfoDataSouce.shared.resetUserInfo()
            
            sleep(1)
            
            let alert = UIAlertController(title: "リセットが完了しました。", message: "アプリを終了し、再起動してください。", preferredStyle: UIAlertController.Style.alert)
            
            let okayButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okayButton)
            
            self.present(alert, animated: true
                , completion: nil)
        }
        let cancelButton = UIAlertAction(title: "キャンセル", style: .destructive, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
        
    }
}
