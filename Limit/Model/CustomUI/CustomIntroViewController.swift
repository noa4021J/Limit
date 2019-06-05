//
//  CustomIntroViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class CustomIntroViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let animator = FadeTransitionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self
        
    }
    
    //基本的に戻れないようにするのでdismiss+isPresentedの変更は不要
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        animator.isPresented = false
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }

}
