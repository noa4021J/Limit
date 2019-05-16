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

    
//    let animationView = LOTAnimationView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        
//        animationView.center.x = self.view.center.x
//        animationView.center.y = self.view.center.y + 50
//        animationView.setAnimation(named: "animation")
//        animationView.loopAnimation = true
//        animationView.animationSpeed = 1.2
//        transformView.addSubview(animationView)
//        animationView.play()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(toIntro8), userInfo: nil, repeats: false)
    }
    
    @objc func toIntro8() {
    }
    
}
