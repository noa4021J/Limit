//
//  intro8ViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import PGEZTransition

class intro8ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
        
        let animationView = LOTAnimationView(frame: CGRect(x: 0, y: 150, width: 140, height: 140))
        animationView.center.x = self.view.center.x
        animationView.setAnimation(named: "check")
        animationView.loopAnimation = false
        animationView.animationSpeed = 1
        
        if storyboardName == "iphone5-5s-5c-SE" {
            animationView.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
            animationView.center.x = self.view.center.x
            animationView.center.y = self.view.center.y - 100
        }
        
        sleep(3)
        
        self.view.addSubview(animationView)
        animationView.play()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func finishedDiagnosis(_ sender: Any) {
        
        let firstCheck:Int = 1
        UserDefaults.standard.set(firstCheck, forKey: "firstCheck")
        
    }
    
    
}
