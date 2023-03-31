//
//  WaterfallVC-LoadData.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/31.
//

import CoreData

extension WaterfallVC{
    func getDraftNotes(){
        let draftNotes = try! context.fetch(DraftNote.fetchRequest() as NSFetchRequest<DraftNote>)
        self.draftNotes = draftNotes
    }
}
