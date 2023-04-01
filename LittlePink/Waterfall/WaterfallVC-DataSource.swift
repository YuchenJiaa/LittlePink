//
//  WaterfallVC-DataSource.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/4/1.
//

import Foundation

extension WaterfallVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if isMyDraft{
            return draftNotes.count
        }else{
            return 13
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isMyDraft{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kdraftNoteWaterfallCellID, for: indexPath) as! DraftNoteWaterfallCell
            cell.draftNote = draftNotes[indexPath.item]
            cell.deleteBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterfallCellID, for: indexPath) as! WaterfallCell
            //use indexPath.item to find the cell in collectionView
            //use indexPath.roll to find the cell tableView
            cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        
            return cell
            
        }
        
    }

}

extension WaterfallVC{
    private func deleteDraftNote(_ index: Int){
        //delete data
        let draftNote = draftNotes[index]
        context.delete(draftNote)
        appDelegate.saveContext()
        draftNotes.remove(at: index)
        
        //UI
        collectionView.performBatchUpdates{
        collectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
        }
    }
}
//Alert - pop-up window
extension WaterfallVC{
    @objc private func showAlert(_ sender: UIButton){
        let index = sender.tag
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete this draft? ", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "No", style: .cancel)
        let action2 = UIAlertAction(title: "Yes", style: .destructive) { _ in self.deleteDraftNote(index)}
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true)
    }
}
