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
        
        let sharedText = "あなたの残りの人生は「\(progress)%」です。- ハート形人生時計アプリ「Limit」"
        let sharedUrl = URL(string: "https://itunes.apple.com/jp/app/limit/id1441079872?mt=8")!
        let sharedImage = UIImage.pngData(self.getScreenShot())
        
        let items:[Any] = [sharedText, sharedUrl, sharedImage]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func getScreenShot() -> UIImage {
        
        let width:CGFloat = UIScreen.main.bounds.width
        let height:CGFloat = 100.0
        
        let captureSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContext(captureSize)
        let context = UIGraphicsGetCurrentContext()!
        
        self.view.layer.render(in: context)
        
        let captureImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return captureImage
        
    }
    
}
