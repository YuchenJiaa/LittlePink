//
//  WaterfallVC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/22.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip

class WaterfallVC: UICollectionViewController {
 
    var channel = ""
    var draftNotes: [DraftNote] = []
    var isMyDraft = true

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        getDraftNotes()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


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
//MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        UIImage(named: "\(indexPath.item + 1)")!.size
        let cellW = (screenRect.width - kWaterfallPadding * 3) / 2
        
        var cellH: CGFloat = 0
        
        if isMyDraft{
            let draftNote = draftNotes[indexPath.item]
            let imageSize = UIImage(draftNote.coverPhoto)?.size ?? imagePH.size
            let imageH = imageSize.height
            let imageW = imageSize.width
            let imageRatio = imageH / imageW
            
            cellH = cellW * imageRatio + kDraftNoteWaterfallCellBottomViewH
        }else{
            cellH = UIImage(named: "\(indexPath.item + 1)")!.size.height
        }
        
        return CGSize(width: cellW, height: cellH)
    }
}

extension WaterfallVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: channel)
    }
}
