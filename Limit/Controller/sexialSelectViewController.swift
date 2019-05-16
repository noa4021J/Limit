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

    
    @IBAction func selectMale(_ sender: Any) {
        
        userSex = "male"
        UserDefaults.standard.set(userSex, forKey: "sex")
        
    }
    
    @IBAction func selectFemale(_ sender: Any) {
        
        userSex = "female"
        UserDefaults.standard.set(userSex, forKey: "sex")
        
    }
    

}
