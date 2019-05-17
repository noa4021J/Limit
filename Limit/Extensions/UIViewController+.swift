//
//  UIViewController+.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/16.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit
import WaveAnimationView

extension UIViewController {
    
    public func setupGradientLayer(colors:[CGColor], frame: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.colors = colors
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }
    
    public func setupWaveAnimationView(front:UIColor, back: UIColor, frame: CGRect, mask: UIImage?) -> WaveAnimationView {
        let waveView = WaveAnimationView(frame: frame, frontColor: front, backColor: back)
        waveView.maskImage = mask
        waveView.layer.shadowColor = UIColor.white.cgColor
        waveView.layer.shadowRadius = 20
        waveView.layer.shadowOpacity = 1
        
        return waveView
    }
    
    public func pushActivityVC(progress: Int) {
        
        let url = URL(string: "https://apple.co/2HCuWCa")
        let sharedText = "あなたの残りの人生は「\(progress)%」です。|  ハート形人生時計アプリ「Limit」- \(url!)"
        let sharedImage = self.getScreenShot()
        
        let items:[Any] = [sharedText, sharedImage]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        print(sharedImage)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func getScreenShot() -> UIImage {

        let captureSize = self.view.bounds.size
        
        UIGraphicsBeginImageContextWithOptions(captureSize, false, 0.0)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        self.view.layer.render(in: context)
        
        let captureImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return captureImage
        
    }
    
}
