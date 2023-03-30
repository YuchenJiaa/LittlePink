//
//  Extensions.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit

extension String{
    var isBlank: Bool{ self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

extension Optional where Wrapped == String{
    var unwrappedText: String{self ?? ""}
}

extension UITextField{
    var unwrappedText: String{text ?? ""}
    var exactText:String{
        unwrappedText.isBlank ? "" : unwrappedText
    }
}

extension UITextView{
    var unwrappedText: String{text ?? ""}
    var exactText:String{
        unwrappedText.isBlank ? "" : unwrappedText
    }
}
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
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self,action:#selector(dismissKeyboard))
        //use this line of codes to let the new gesture not affect other touch
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension Bundle{
    static func loadView<T>(fromNib name: String, with type: T.Type) -> T{
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T{
            return view
        }
        fatalError("Failed to load \(type) view")
    }
}
