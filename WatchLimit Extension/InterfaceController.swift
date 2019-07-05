//
//  InterfaceController.swift
//  WatchLimit Extension
//
//  Created by Syunsuke Nakao on 2019/06/21.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var WaveImageView: WKInterfaceImage!
    
    @IBOutlet weak var group: WKInterfaceGroup!
    
    let imageFrame = CGRect(x: 0, y: 0, width: 120, height: 120)
    
    private var drawSeconds: CGFloat = 0.0
    private var drawElapsedTime: CGFloat = 0.0
    
    var width: CGFloat = 100.0
    var height: CGFloat = 100.0
    
    var xAxis: CGFloat
    var yAxis: CGFloat
    
    var waveHeight: CGFloat = 20.0
    
    var progress: Float {
        willSet {
            self.xAxis = self.height - self.height*CGFloat(min(max(newValue, 0),1))
        }
    }
    
    override init() {
        self.width = imageFrame.width
        self.height = imageFrame.height
        self.xAxis = floor(height/2)
        self.yAxis = 0.0
        self.progress = 1.0
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        super.willActivate()
        self.progress = 0.3
        Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(waveAnimation), userInfo: nil, repeats: true)
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @objc func waveAnimation() {
        
        // コンテキストを設定
        UIGraphicsBeginImageContextWithOptions(imageFrame.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let cgImage = UIImage(named: "heart")?.cgImage
 
        
        let time = drawElapsedTime/0.5
        let unit:CGFloat = 100.0
        let zoom:CGFloat = 1.0
        var x = time
        var y = sin(x)/zoom
        
        let start = CGPoint(x: yAxis, y: unit*y+xAxis)
        
        context?.clip(to: imageFrame, mask: cgImage!)
        
        context?.beginPath()
        context?.move(to: start)
        
        var i = yAxis
        while i <= width+10 {
            x = time+(-yAxis+i)/unit/zoom
            y = sin(x)/self.waveHeight
            
            context?.addLine(to: CGPoint(x: i, y: unit*y+xAxis))
            
            i += 10
        }
        context?.addLine(to: CGPoint(x: width+10, y: -height))
        context?.addLine(to: CGPoint(x: imageFrame.minX, y: -height))
        context?.closePath()
        
        context?.setFillColor(UIColor.white.withAlphaComponent(1).cgColor)
        context?.setShadow(offset: CGSize(width: 0, height: 5), blur: 10, color: UIColor.white.cgColor)
        context?.fillPath()
        
        // 描画した画像をスクリーンショットとして保存
        let secondHandImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let rotatedImage = secondHandImage?.rotatedBy(degree: 180.0)
        
        // 1秒毎に画像（秒針）を更新
        group.setBackgroundImage(rotatedImage!)

        drawSeconds += 0.009
        drawElapsedTime = drawSeconds*CGFloat(Double.pi)
        if drawElapsedTime >= CGFloat(Double.pi) {
            drawSeconds = 0.0
            drawElapsedTime = 0.0
        }
    }
    
    func secondWaveAnimation() {
        
        // コンテキストを設定
        UIGraphicsBeginImageContextWithOptions(imageFrame.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let cgImage = UIImage(named: "heart")?.cgImage
        
        let time = drawElapsedTime/0.5
        let unit:CGFloat = 100.0
        let zoom:CGFloat = 1.0
        var x = time
        var y = sin(x)/zoom
        
        let start = CGPoint(x: yAxis, y: unit*y+xAxis)
        
        context?.clip(to: imageFrame, mask: cgImage!)
        
        context?.beginPath()
        context?.move(to: start)
        
        var i = yAxis
        while i <= width+10 {
            x = time+(-yAxis+i)/unit/zoom
            y = sin(x-100)/self.waveHeight
            
            context?.addLine(to: CGPoint(x: i, y: unit*y+xAxis))
            
            i += 10
        }
        context?.addLine(to: CGPoint(x: width+10, y: -height))
        context?.addLine(to: CGPoint(x: imageFrame.minX, y: -height))
        context?.closePath()
        
        context?.setFillColor(UIColor.white.withAlphaComponent(0.5).cgColor)
        context?.fillPath()
        
        // 描画した画像をスクリーンショットとして保存
        let secondHandImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let rotatedImage = secondHandImage?.rotatedBy(degree: 180.0)
        
        // 1秒毎に画像（秒針）を更新
        WaveImageView.setImage(rotatedImage!)
        
        drawSeconds += 0.009
        drawElapsedTime = drawSeconds*CGFloat(Double.pi)
        if drawElapsedTime >= CGFloat(Double.pi) {
            drawSeconds = 0.0
            drawElapsedTime = 0.0
        }
    }
    

}

extension UIImage {
    
    func setbackColor(color: UIColor, frame: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fillPath()
        context.draw(self.cgImage!, in: frame)
        
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return coloredImage
    }
    
    func rotatedBy(degree: CGFloat) -> UIImage {
        let radian = -degree * CGFloat.pi / 180
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: self.size.width / 2, y: self.size.height / 2)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.rotate(by: radian)
        context.draw(self.cgImage!, in: CGRect(x: -(self.size.width / 2), y: -(self.size.height / 2), width: self.size.width, height: self.size.height))
        
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return rotatedImage
    }
    
}
