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
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    

}

extension NoteEditVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
