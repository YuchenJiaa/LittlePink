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
}
