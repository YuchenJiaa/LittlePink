//
//  NoteEdit-Config.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/27.
//

import Foundation

extension NoteEditVC{
    func config(){
        //turn on the drag interactive function
        photoCollectionView.dragInteractionEnabled = true
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        
//        textView.isScrollEnabled = false
//        textView.textContainer.lineBreakMode = .byWordWrapping
        
        //Remove text and placeholder margins (top bottom left and right margins)
        let lineFragmentPadding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFragmentPadding, bottom: 0, right: -lineFragmentPadding)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let typingAttributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.secondaryLabel
        ]
        textView.typingAttributes = typingAttributes
        
        if let TextViewIAView = Bundle.main.loadNibNamed("TextViewIAView", owner: nil, options: nil)?.first as? TextViewIAView{
            textView.inputAccessoryView = TextViewIAView
            
            TextViewIAView.doneBtn.addTarget(self, action: #selector(resignTextView), for: .touchUpInside)
            textViewIAView.maxTextCountLabel.text = "/\(kMaxNoteTextCount)"
        }
        
    }
}

extension NoteEditVC{
    @objc private func resignTextView(){
        textView.resignFirstResponder()
    }
}
