//
//  WaterfallVC-LoadData.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/31.
//

import CoreData

extension WaterfallVC{
    func getDraftNotes(){
        let request = DraftNote.fetchRequest() as NSFetchRequest<DraftNote>
        //sort
        let sortDescriptor = NSSortDescriptor(key: "updatedAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        //To improve the perfomance
        request.propertiesToFetch = ["coverPhoto", "title", "updatedAt", "isVideo"]
        let draftNotes = try! context.fetch(request)
        self.draftNotes = draftNotes
    }
}
