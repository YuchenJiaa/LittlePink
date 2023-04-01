//
//  WaterfallVC-Delegate.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

import Foundation

extension WaterfallVC{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isMyDraft{
            let draftNote = draftNotes[indexPath.item]
            if let photoData = draftNote.photos,
               let photoDataArr = try? JSONDecoder().decode([Data].self, from: photoData){
                let photos = photoDataArr.map{data -> UIImage in UIImage(data) ?? imagePH}
                let videoURL =  FileManager.default.save(draftNote.video, to: "video", as: "\(UUID().uuidString).mp4")
                let vc = storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC
                vc.draftNote = draftNote
                vc.photos = photos
                vc.videoURL = videoURL
                
                navigationController?.pushViewController(vc, animated: true)
            }else{
                showTexHUD("Failed to load draft note")
            }
        }else{
            
        }
    }
}
