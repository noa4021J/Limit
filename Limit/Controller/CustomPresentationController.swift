//
//  MenuPC.swift
//  
//
//  Created by Syunsuke Nakao on 2019/05/17.
//

import UIKit

//class CustomPresentationController: UIPresentationController {
//    
//    var overlay: UIView = UIView()
//    
//    override func presentationTransitionWillBegin() {
//        guard let containerView = containerView else {
//            return
//        }
//        overlay.frame = containerView.frame
//        overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(overlayDidTouch(_:)))]
//        overlay.backgroundColor = .black
//        overlay.alpha = 0.0
//        containerView.insertSubview(overlay, at: 0)
//        
//        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
//            self?.overlay.alpha = 0.4
//        }, completion: nil)
//    }
//    
//    override func dismissalTransitionWillBegin() {
//        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
//            self?.overlay.alpha = 0.0
//            }, completion: nil)
//    }
//    
//    override func dismissalTransitionDidEnd(_ completed: Bool) {
//        if completed {
//            overlay.removeFromSuperview()
//        }
//    }
//    
////    override var frameOfPresentedViewInContainerView: CGRect {
//////        var presentedViewFrame = CGRect.zero
//////        presentedViewFrame.size =
//////        presentedViewFrame.origin.x = 0.0
//////        presentedViewFrame.origin.y = containerView!.frame.maxY - presentedViewFrame.size.height
////    }
////
//    override func containerViewWillLayoutSubviews() {
//        <#code#>
//    }
//    
//    override func containerViewDidLayoutSubviews() {
//        <#code#>
//    }
//    
//    @objc func overlayDidTouch(_ sender: UITapGestureRecognizer) {
//        presentedViewController.dismiss(animated: true, completion: nil)
//    }
//    
//}
