//
//  ClockViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/15.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit
import WaveAnimationView

class ClockViewController: UIViewController {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var lapView: UIView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    private var waveView: WaveAnimationView!
    
    private let counter = LifeSpanCounter()
    
    deinit {
        waveView.stopAnimaiton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupClockView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter.timeUpdater(update: { (data) in
                
                self.yearLabel.text = String(data["limitYear"] as! Int)
                self.monthLabel.text = String(data["limitMonth"] as! Int)
                self.dayLabel.text = String(data["limitDay"] as! Int)
                self.hourLabel.text = String(data["limitHour"] as! Int)
                self.minuteLabel.text = String(data["limitMinute"] as! Int)
                self.secondLabel.text = String(data["limitSecond"] as! Int)
                self.waveView.setProgress(to:  data["percentage"] as! Float)
                self.progressLabel.text = "\(Int(data["percentage"] as! Float*100))%"
                
            })
        }
        
    }
    
    @IBAction func share(_ sender: UIButton) {
        pushActivityVC(progress: Int(self.waveView.progress))
    }
    
    private func setupClockView() {
        waveView = setupWaveAnimationView(front: UIColor.white.withAlphaComponent(0.5), back: UIColor.white.withAlphaComponent(0.5), frame: CGRect(x: 0, y: 0, width: lapView.bounds.width, height: lapView.bounds.height), mask: UIImage(named: "heart"))
        
        let layer = setupGradientLayer(colors: [UIColor(hexcode: "#88d3ce", alpha: 1).cgColor, UIColor(hexcode: "#6e45e2", alpha: 1).cgColor], frame: self.view.frame)
        
        self.view.layer.insertSublayer(layer, at: 0)
        self.lapView.addSubview(waveView)
        
        waveView.startAnimation()
    }
    
}
