//
//  ViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/24.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ボタンの生成
        let mainButton = UIButton()
        mainButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        mainButton.layer.cornerRadius = 30
        
        mainButton.setTitle("＋", for: .normal)
        
        mainButton.backgroundColor = UIColor.orange
        mainButton.titleLabel?.textColor = UIColor.white
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        
        mainButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        
        let shadowView = UIView(frame: mainButton.frame)
        shadowView.layer.shadowColor = UIColor.orange.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowOpacity = 0.7
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(mainButton)
        self.view.addSubview(shadowView)
        
        //autolayout
        shadowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80.0).isActive = true
        shadowView.widthAnchor.constraint(equalToConstant: mainButton.frame.width).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: mainButton.frame.height).isActive = true
        
        //背景の生成
        let backgroundLayer = CAGradientLayer()
        let color1 = UIColor.init(hexcode: "#30cfd0", alpha: 1).cgColor
        let color2 = UIColor.init(hexcode: "#330867", alpha: 1).cgColor
        backgroundLayer.frame = self.view.frame
        backgroundLayer.colors = [color1,color2]
        backgroundLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        backgroundLayer.endPoint = CGPoint(x: 0.0, y: 1.0)

        self.view.layer.insertSublayer(backgroundLayer, at: 0)

    }
    
    @objc func share() {
        
    }


}
