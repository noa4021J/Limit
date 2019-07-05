//
//  ClockViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/15.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit
import WaveAnimationView
import SharedLifeSpan

class ClockViewController: UIViewController {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var lapView: UIView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    private let counter = LifeSpanCounter()
    private let colorThemeSource = ColorThemeSource()
    
    private var waveView: WaveAnimationView!
    
    private lazy var setupWaveView: (()->Void)? = {
        
        //ViewDidLayoutSubviewsの中で１度だけ実行される
        self.waveView = self.setupWaveAnimationView(
            front: UIColor.white.withAlphaComponent(0.5),
            back: UIColor.white.withAlphaComponent(0.5),
            frame: CGRect(x: 0,
                          y: 0,
                          width: self.lapView.bounds.size.width,
                          height: self.lapView.bounds.size.height
            ),
            mask: UIImage(named: "heart")
        )
        
        let layer = self.setupGradientLayer(colorThemeType: ColorThemeSource.currentTheme, size: self.view.bounds.size)
        
        self.view.layer.insertSublayer(layer, at: 0)
        self.lapView.addSubview(self.waveView)
        self.waveView.startAnimation()
        
        //１度実行された直後にnilを返すため2回目以降は実行されない
        return nil
    }()
    
    deinit {
        waveView.stopAnimation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setGradientColor), name: .valueChanged, object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupWaveView?()
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
                
                self.waveView.setProgress(Float(data["totalDays"] as! Int)/Float(data["allDays"] as! Int))
                self.progressLabel.text = "\(Int(self.waveView.progress*100))%"
                
                self.title = "残り\(data["totalDays"] as! Int)日"
                
            })
        }
        
    }
    
    @IBAction func share(_ sender: UIButton) {
        shareLifeSpanWithImage(progress: Int(waveView.progress*100))
    }
    
    @IBAction func setting(_ sender: UIBarButtonItem) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let settingView: SettingViewController
            = storyBoard.instantiateViewController(withIdentifier: "setting") as! SettingViewController
        
        settingView.modalPresentationStyle = .overFullScreen
        settingView.modalTransitionStyle = .crossDissolve
        
        self.present(settingView, animated: true, completion: nil)
        
    }
    
    @objc func setGradientColor() {
        
        if let gradient: CAGradientLayer = self.view.layer.sublayers?.first as? CAGradientLayer {
            let colors = [
                UIColor(hexcode: ColorThemeSource.currentTheme.hexCodeSet.0, alpha: 1).cgColor,
                UIColor(hexcode: ColorThemeSource.currentTheme.hexCodeSet.1, alpha: 1).cgColor
            ]
            gradient.colors = colors
        }
        
    }
    
    
}
