//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit


class NoteEditVC: UIViewController {
    
    var draftNote: DraftNote?
    var updateDraftNoteFinished: (() -> ())?
    
    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!
    ]
    
    //var videoURL: URL = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL: URL?
    
    var channel = ""
    var subChannel = ""
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    
    
    var photoCount: Int{ photos.count }
    var isVideo: Bool{videoURL != nil}
    var textViewIAView: TextViewIAView{
        textView.inputAccessoryView as! TextViewIAView
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUI()
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {
    }
    
    @IBAction func TFEditChanged(_ sender: Any) {handleTFEditChanged()}
    //using coreDate save data
    @IBAction func saveDraftNote(_ sender: Any) {
        validateNote()
        if let draftNote = draftNote{
            updateDraftNote(draftNote)
        }else{
            createDraftNote()
        }
    }
        
    @IBAction func ShareNote(_ sender: Any) {
        validateNote()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        view.endEditing(true)
        if let channelVC = segue.destination as? ChannelVC{
            channelVC.PVDelegate = self
        }
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

extension NoteEditVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else{return}
        textViewIAView.currentTextCount = textView.text.count
    }
}

extension NoteEditVC: ChannelVCDelegate{
    func updateChannel(channel: String, subChannel: String) {
        //data
        self.channel = channel
        self.subChannel = subChannel
        //UI
        updateChannelUI()
        
    }
}



