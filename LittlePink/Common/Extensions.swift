//
//  Extensions.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit


//set a new attribute for the system in the storyboard
extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIViewController{
    
    //MARK: - To show a loading or alert dialog
    func showTexHUD(_ title: String, _ subTitle: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
}
