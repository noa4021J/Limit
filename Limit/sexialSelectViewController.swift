//
//  sexialSelectViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import PGEZTransition

class sexialSelectViewController: UIViewController {
    
    @IBOutlet weak var transformView: PGTransformView!
    @IBOutlet weak var title1: PGTransformLabel!
    @IBOutlet weak var maleButton: PGTransformButton!
    @IBOutlet weak var femaleButton: PGTransformButton!
    
    let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
    
    private var transition:PGTransformTransition!
    
    private lazy var nextVC:birthdaySelectViewController = {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "birthday") as! birthdaySelectViewController
    }()
    
    var userSex:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitionSetUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func selectMale(_ sender: Any) {
        
        userSex = "male"
        UserDefaults.standard.set(userSex, forKey: "sex")
        
        self.transition.presentTransformViewController()
        
    }
    
    @IBAction func selectFemale(_ sender: Any) {
        
        userSex = "female"
        UserDefaults.standard.set(userSex, forKey: "sex")
        
        self.transition.presentTransformViewController()
        
    }
    

}

extension sexialSelectViewController {
    
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
        
        maleButton
            .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.zero, start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
        femaleButton
            .setStartTransform(.rateX(0.3), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.zero, start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
    }
    
}
