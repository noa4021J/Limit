//
//  UIView+.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/16.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    /// 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /// 角丸の大きさ
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// 影の色
    @IBInspectable var shadowColor: UIColor? {
        get {
            return layer.shadowColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.masksToBounds = false
        }
    }
    
    /// 影の透明度
    @IBInspectable var shadowAlpha: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// 影のオフセット
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// 影のぼかし量
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    
    func drawSideBorder(borderWidth: CGFloat, borderColor: UIColor, UI: UIView, side: borderSide) -> CALayer {
        let border = CALayer()
        
        border.frame = side.getFrame(UI: UI, borderWidth: borderWidth)
        border.backgroundColor = borderColor.cgColor
        return border
    }
    
}

enum borderSide {
    case top
    case bottom
    case left
    case right
    
    func getFrame(UI:UIView, borderWidth: CGFloat) -> CGRect {
        switch self {
        case .top:
            return CGRect(x: 0, y: 0, width: UI.bounds.size.width, height: borderWidth)
        case .bottom:
            return CGRect(x: 0, y: UI.bounds.maxY-borderWidth, width: UI.bounds.size.width, height: borderWidth)
        case .left:
            return CGRect(x: 0, y: 0, width: borderWidth, height: UI.bounds.size.height)
        case .right:
            return CGRect(x: UI.bounds.maxX-borderWidth, y: 0, width: borderWidth, height: UI.bounds.size.height)
        }
    }
    
}
