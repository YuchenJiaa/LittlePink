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
        
        //Remove text and placeholder margins (top bottom left and right margins)
        let lineFragmentPadding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFragmentPadding, bottom: 0, right: -lineFragmentPadding)
    }
}
