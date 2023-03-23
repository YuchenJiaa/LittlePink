//
//  TabBarC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/22.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    //if return true, then will show a classic show, otherwise a customize show
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? ShareVC{
            
            var config = YPImagePickerConfiguration()
            // [Edit configuration here ...]
            //MARK: General settings
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = "LittlePink"
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.maxCameraZoomFactor = 5
            
            //MARK: Library settings
            config.library.mediaType = .photoAndVideo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.numberOfItemsInRow = 4
            config.library.preSelectItemOnMultipleSelection = false
            
            //MARK: Gallery settings
            config.gallery.hidesRemoveButton = false
            

            // Build a picker with your configuration
            let picker = YPImagePicker(configuration: config)

            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        return true
        
    }


}
