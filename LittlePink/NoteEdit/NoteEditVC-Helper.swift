//
//  NoteEditVC-Helper.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

import Foundation

extension NoteEditVC{
    func validateNote(){
        
        guard textViewIAView.currentTextCount <= kMaxNoteTextCount else{
            showTexHUD("Up to \(kMaxNoteTextCount) characters are allowed")
            return
        }
    }
    
    func handleTFEditChanged(){
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
}
