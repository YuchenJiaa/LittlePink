//
//  TabBarC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/22.
//

import UIKit

class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    //if return true, then will show a classic show, otherwise a customize show
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? ShareVC{
            
            
            return false
        }
        return true
        
    }


}
