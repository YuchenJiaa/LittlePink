//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/23.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
}
