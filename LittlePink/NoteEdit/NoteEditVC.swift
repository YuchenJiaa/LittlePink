//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit


class NoteEditVC: UIViewController {

    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!
    ]
    
    //var videoURL: URL = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL: URL?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    var photoCount: Int{ photos.count }
    var isVideo: Bool{videoURL != nil}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //turn on the drag interactive function
        photoCollectionView.dragInteractionEnabled = true
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {
    }
    
    @IBAction func TFEditChanged(_ sender: Any) {
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
}

extension NoteEditVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //range.location -- The index of the first character of the current input or pasted text.
        //string -- The current input of a specific character or pasted text
        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount
        if isExceed{
            showTexHUD("The title can be up to \(kMaxNoteTitleCount) characters maximum")
        }
//        if range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount{
//            return false
//        }
        return !isExceed
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
}
