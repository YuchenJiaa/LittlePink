//
//  NoteEditVC-DraftNote.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

extension NoteEditVC{
    func createDraftNote(){
        backgroundContext.perform {
            let draftNote = DraftNote(context: backgroundContext)
            if self.isVideo{
                draftNote.video = try? Data(contentsOf: self.videoURL!)
            }
            self.handlePhoto(draftNote)
        
            draftNote.isVideo = self.isVideo
            self.handleOthers(draftNote)
            DispatchQueue.main.async {
                self.showTexHUD("Draft note saved successfully")
            }
        }
        dismiss(animated: true)
    }
    
    func updateDraftNote(_ draftNote: DraftNote){
        backgroundContext.perform {
            if !self.isVideo{
                self.handlePhoto(draftNote)
            }
            self.handleOthers(draftNote)
            
            DispatchQueue.main.async {
                self.updateDraftNoteFinished?()
                //self.showTexHUD("Draft note updated successfully")
            }
        }
        
        navigationController?.popViewController(animated: true)
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
        DispatchQueue.main.async {
            draftNote.title = self.titleTextField.exactText
            draftNote.text = self.textView.exactText
        }
        draftNote.channel = channel
        draftNote.subChannel = subChannel
        draftNote.updatedAt = Date()
        
        appDelegate.saveBackgroundContext()
    }
}
