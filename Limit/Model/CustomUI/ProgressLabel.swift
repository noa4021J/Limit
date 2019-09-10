//
//  CustomUILabel.swift
//  Limit
//
//  Created by Shunsuke Nakao on 2019/09/09.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation
import UIKit

class ProgressLabel: UILabel {
    
    @IBInspectable open var kernSpacing: CGFloat = 0 {
        didSet {
            setAttributedText()
        }
    }
    @IBInspectable open var DecimalFontSize: CGFloat = 0 {
        didSet {
            setAttributedText()
        }
    }
    
    override var text: String? {
        didSet{
            setAttributedText()
        }
    }
    
    
    private func setAttributedText() {
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: self.kernSpacing,
            range: NSRange(
                location: 0,
                length: attributedString.length)
        )
        attributedString.addAttribute(
            NSAttributedString.Key.font,
            value: self.font.withSize(self.DecimalFontSize),
            range: NSRange(
                location: 3,
                length: 2)
        )
        self.attributedText = attributedString
    }
    
}
