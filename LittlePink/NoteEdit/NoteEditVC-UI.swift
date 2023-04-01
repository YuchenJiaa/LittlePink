//
//  NoteEdit-UI.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

extension NoteEditVC{
    func setUI(){
        setDraftNoteEditUI()
    }
}

extension NoteEditVC{
    private func setDraftNoteEditUI(){
        if let draftNote = draftNote{
            titleTextField.text = draftNote.title
            textView.text = draftNote.text
            channel = draftNote.channel!
            subChannel = draftNote.subChannel!
            if !subChannel.isEmpty{updateChannelUI()}
        }
        
    }
    func updateChannelUI(){
        channelLabel.text = subChannel
        channelIcon.tintColor = blueColor
        channelLabel.textColor = blueColor
        channelPlaceholderLabel.isHidden = true
    }
}
