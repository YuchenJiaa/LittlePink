//
//  NoteEditVC-DraftNote.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

extension NoteEditVC{
    func createDraftNote(){
        let draftNote = DraftNote(context: context)
        if isVideo{
            draftNote.video = try? Data(contentsOf: videoURL!)
        }
        handlePhoto(draftNote)
        
        draftNote.isVideo = isVideo
        handleOthers(draftNote)
    }
    
    func updateDraftNote(_ draftNote: DraftNote){
        if !isVideo{
            handlePhoto(draftNote)
        }
        handleOthers(draftNote)
    }
}

extension NoteEditVC{
    private func handlePhoto(_ draftNote: DraftNote){
        draftNote.coverPhoto = photos[0].jpeg(.high)
        //Encoder不能对UIImage编码，所以要先循环，把每个都变成Data类型再append进一个新数组，对这个新数组进行编码
        var photos: [Data] = []
        for photo in self.photos{
            if let pngData = photo.pngData(){
                photos.append(pngData)
            }
        }
        draftNote.photos = try? JSONEncoder().encode(photos)
    }
    
    private func handleOthers(_ draftNote: DraftNote){
        draftNote.title = titleTextField.exactText
        draftNote.text = textView.exactText
        draftNote.channel = channel
        draftNote.subChannel = subChannel
        draftNote.updatedAt = Date()
        
        appDelegate.saveContext()
    }
}
