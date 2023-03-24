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
