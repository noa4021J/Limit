//
//  diagnosisViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import Lottie
import PGEZTransition

class diagnosisViewController: UIViewController {
    
    @IBOutlet weak var transformView: PGTransformView!
    @IBOutlet weak var title1: PGTransformLabel!
    
    let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
    
    private var transition:PGTransformTransition!
    
    private lazy var nextVC:intro8ViewController = {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "intro8ViewController") as! intro8ViewController
    }()
    
    let animationView = LOTAnimationView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitionSetUp()
        
        animationView.center.x = self.view.center.x
        animationView.center.y = self.view.center.y + 50
        animationView.setAnimation(named: "animation")
        animationView.loopAnimation = true
        animationView.animationSpeed = 1.2
        transformView.addSubview(animationView)
        animationView.play()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(toIntro8), userInfo: nil, repeats: false)
    }
    
    @objc func toIntro8() {
        self.transition.presentTransformViewController()
    }
    
}

extension diagnosisViewController {
    
    func transitionSetUp() {
        
        self.transition = PGTransformTransition.init(target: self, presenting: self.nextVC)
        
        transformView
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndAlpha(0.0, start: 0.0, duration: 1.0)
        
        title1
            .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.zero, start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
    }
    
}
