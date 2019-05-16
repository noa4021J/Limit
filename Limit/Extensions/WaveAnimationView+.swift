//
//  WaveAnimationView+.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/16.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import WaveAnimationView

extension WaveAnimationView {
    
    public func getScreenShot(view: UIView) -> UIImage {
        
        let width:CGFloat = UIScreen.main.bounds.width
        let height:CGFloat = 100.0
        
        let captureSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContext(captureSize)
        let context = UIGraphicsGetCurrentContext()!
        
        view.layer.render(in: context)
        
        let captureImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return captureImage
        
    }
    
}
