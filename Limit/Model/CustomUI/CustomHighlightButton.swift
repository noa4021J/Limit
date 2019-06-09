//
//  CustomHighlightButton.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/06.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class CustomHighlightButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            switch isHighlighted {
            case true:
                backgroundColor = UIColor(hexcode: "#e0e0e0", alpha: 1)
            case false:
                backgroundColor = UIColor.white
            }
        }
    }
    
}
