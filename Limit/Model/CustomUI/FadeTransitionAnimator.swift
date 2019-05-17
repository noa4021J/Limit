//
//  FadeTransitionAnimator.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/14.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation
import UIKit

class FadeTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    //遷移してきた = true
    //遷移先から戻ってきた = false
    var isPresented: Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        //animationの時間を設定
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //アニメーションの具体的な処理
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        switch isPresented{
        case true:
            dismiss(transitionContext: transitionContext, toView: toVC!.view, fromView: fromVC!.view)
        case false:
            present(transitionContext: transitionContext, toView: toVC!.view, fromView: fromVC!.view)
        }
        
    }
    
    //遷移するときのアニメーション
    func present(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        
        let container = transitionContext.containerView
        container.insertSubview(toView, belowSubview: fromView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            fromView.alpha = 0.05
        }) { (finished) in
            fromView.alpha = 0.0
            transitionContext.completeTransition(true)
        }
    }
    
    //戻ってくるときのアニメーション
    func dismiss(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        let container = transitionContext.containerView
        container.insertSubview(toView, aboveSubview: fromView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            
            toView.alpha = 0.05
            
        }) { (finished) in
            toView.alpha = 0.0
            transitionContext.completeTransition(true)
        }
    }
    
}
