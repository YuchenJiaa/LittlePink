//
//  Extensions.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit
import DateToolsSwift

extension String{
    var isBlank: Bool{ self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

extension Optional where Wrapped == String{
    var unwrappedText: String{self ?? ""}
}

extension Date{
    var formattedDate: String{
        let currentYear = Date().year
        if year == currentYear{
            if isToday{
                if minutesAgo > 10{
                    return "Today \(format(with: "HH:mm"))"
                }else{
                    return timeAgoSinceNow
                }
            }else if isYesterday{
                return "Yesterday \(format(with: "HH:mm"))"
            }else{
                return format(with: "MM-dd")
            }
        }else if year < currentYear{
            return format(with: "yyyy-MM-dd")
        }else{
            return "Future time is not allowed"
        }
    }
}

extension UIImage{
    
    convenience init?(_ data: Data?) {
        if let unwrappedData = data{
            self.init(data: unwrappedData)
        }else{
            return nil
        }
    }
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data?{
        jpegData(compressionQuality: jpegQuality.rawValue)
    }
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

extension FileManager{
    //Appending a path component to a URL is commonly done using 'appendingPathComponent', while for a path, it can be done by simply concatenating or interpolating the strings
    func save(_ data: Data?, to dirName: String, as fileName: String) -> URL?{
        guard let data = data else {
            //print("the input data is nil")
            return nil
        }
        
        //1.path transfer URL,URL transfer path
        //2.need to specify a URL first when creating folders and files
        //3.use 'fileExists' to check whether a folder or file already exists before creating a new one
        
        //create dirctory
        //"file:///xx/xx/tmp/dirName"
        //Also can use temporaryDirectory to instead of fileURLWithPath: NSTemporaryDirectory()
        let dirURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(dirName, isDirectory: true)
        
        if !fileExists(atPath: dirURL.path){
            guard let _ = try? createDirectory(at: dirURL, withIntermediateDirectories: true) else {
                print("Failed to create a directory")
                return nil
            }
        }
        
        //Write to file
        //"file:///xx/xx/tmp/dirName/fileName"
        let fileURL = dirURL.appendingPathComponent(fileName)
        
        if !fileExists(atPath: fileURL.path){
            guard let _ = try? data.write(to: fileURL) else {
                print("Failded to write to a file")
                return nil
            }
        }
        
        return fileURL
    }
}

