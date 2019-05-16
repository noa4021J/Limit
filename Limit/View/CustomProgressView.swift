//
//  CustomProgressView.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class CustomProgressView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let path = UIBezierPath(arcCenter: skullCenter,radius: skullRadius, startAngle: 0.0,endAngle: 2 * CGFloat.pi, clockwise: false)
        
        path.lineWidth = 5.0
        UIColor.white.set()
        path.stroke()
        
        
    }

}
