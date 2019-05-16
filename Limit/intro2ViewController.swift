//
//  intro2ViewController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2018/10/27.
//  Copyright © 2018 Syunsuke Nakao. All rights reserved.
//

import UIKit
import PGEZTransition

class intro2ViewController: UIViewController {
    
    @IBOutlet weak var transformView: PGTransformView!
    @IBOutlet weak var title1: PGTransformLabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let storyboardName = UserDefaults.standard.object(forKey: "storyboard") as! String
    
    private var transition:PGTransformTransition!
    
    private lazy var nextVC:intro3ViewController = {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "intro3ViewController") as! intro3ViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    @IBAction func next(_ sender: Any) {
      
    }
}

