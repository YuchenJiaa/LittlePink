//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit


class NoteEditVC: UIViewController {
    
    var draftNote: DraftNote?
    
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
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount{
            
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            
            showTexHUD("Up to \(kMaxNoteTitleCount) characters are allowed")
            
            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
        }
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    //using coreDate save data
    @IBAction func saveDraftNote(_ sender: Any) {
        guard textViewIAView.currentTextCount <= kMaxNoteTextCount else{
            showTexHUD("Up to \(kMaxNoteTextCount) characters are allowed")
            return
        }
        
        let draftNote = DraftNote(context: context)
        if isVideo{
            draftNote.video = try? Data(contentsOf: videoURL!)
        }
        draftNote.coverPhoto = photos[0].jpeg(.high)
        //Encoder不能对UIImage编码，所以要先循环，把每个都变成Data类型再append进一个新数组，对这个新数组进行编码
        var photos: [Data] = []
        for photo in self.photos{
            if let pngData = photo.pngData(){
                photos.append(pngData)
            }
        }
        draftNote.photos = try? JSONEncoder().encode(photos)
        
        draftNote.isVideo = isVideo
        draftNote.title = titleTextField.exactText
        draftNote.text = textView.exactText
        draftNote.channel = channel
        draftNote.subChannel = subChannel
        draftNote.updatedAt = Date()
        
        appDelegate.saveContext()
    }
    
    @IBAction func ShareNote(_ sender: Any) {
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
        channelLabel.text = subChannel
        channelIcon.tintColor = blueColor
        channelLabel.textColor = blueColor
        channelPlaceholderLabel.isHidden = true
        
    }
}



