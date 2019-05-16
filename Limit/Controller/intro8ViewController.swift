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
