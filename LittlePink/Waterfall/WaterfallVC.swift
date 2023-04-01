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
        print(NSHomeDirectory())
        //FileManager.default.save(UIImage(named: "1")?.pngData(), to: "testDir", as: "testFile")
    }

}
//MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
