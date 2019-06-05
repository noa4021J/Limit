//
//  CustomNavigationController.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/05/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //NavigationBarを透明に
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        //NavigationBaritemのitem色を白へ
        navigationBar.tintColor = UIColor.white
        //文字色を白に
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
