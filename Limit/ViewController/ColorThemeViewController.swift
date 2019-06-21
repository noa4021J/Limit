//
//  ColorThemeViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/17.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class ColorThemeViewController: UIViewController {
    
    private let colorThemeSource = ColorThemeSource()
    
    private var colorButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColorButtons()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearColorButtons()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let tapEvent = touches.first else { return }
        
        let tapLocation = tapEvent.location(in: self.view)
        
        if view.frame.contains(tapLocation) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func appearColorButtons() {
        
        for button_i in 0..<colorButtons.count {
            
            let angle: CGFloat = CGFloat(360/(colorButtons.count)*(button_i+1))
            let radius: CGFloat = 100.0
            let rad: CGFloat = CGFloat.pi / 180.0 * angle
            
            UIView.animate(withDuration: 0.3,delay: 0, options: .curveEaseOut, animations: {
                
                let moveX = self.colorButtons[button_i].center.x + (radius * cos(rad))
                let moveY = self.colorButtons[button_i].center.y + (radius * sin(rad))
                
                self.colorButtons[button_i].center = CGPoint(x: moveX, y: moveY)
                self.colorButtons[button_i].alpha = 1.0
                
            },completion: nil)
            
        }
        
    }
    
    private func setupColorButtons() {
        
        let buttons = colorThemeSource.getThemeList().enumerated().map { (i, theme) -> UIButton in
            
            let button = UIButton()
            
            button.frame = CGRect(
                origin: CGPoint(x: self.view.center.x-20, y: self.view.center.y-20),
                size: CGSize(width: 40, height: 40)
            )
            
            button.addTarget(self, action: #selector(selectColorTheme(_:)), for: .touchUpInside)
            
            button.clipsToBounds = true
            button.layer.cornerRadius = 20
            
            button.layer.insertSublayer(
                self.setupGradientLayer(colorThemeType: theme, size: button.bounds.size),
                at: 0
            )
            
            button.tag = i
            
            button.alpha = 0.0
            
            view.addSubview(button)
            
            return button
            
        }
        
        colorButtons = buttons
        
    }
    
    @objc func selectColorTheme(_ sender: UIButton) {
        
        let colorList = colorThemeSource.getThemeList()
        colorThemeSource.setColorTheme(colorList[sender.tag])
        
        NotificationCenter.default.post(name: .valueChanged, object: nil)
        
    }

}
