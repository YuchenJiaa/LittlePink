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
        if viewController is ShareVC{
            
            
            
            var config = YPImagePickerConfiguration()
            // [Edit configuration here ...]
            //MARK: General settings
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = "LittlePink"
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.maxCameraZoomFactor = kMaxCameraZoomFactor
            
            //MARK: Library settings
            config.library.mediaType = .photo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.preSelectItemOnMultipleSelection = false
            
            //MARK: Gallery settings
            config.gallery.hidesRemoveButton = false
            

            // Build a picker with your configuration
            let picker = YPImagePicker(configuration: config)

            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled{
                    picker.dismiss(animated: true)
                }else{
                    var photos: [UIImage] = []
                    var videoURL: URL?
                    
                    for item in items {
                        switch item {
                        case let .photo(photo):
                            print(photo)
                            photos.append(photo.image)
                        case .video(let video):
                            print(video)
                            photos.append(video.thumbnail)
                            videoURL = video.url
                        }
                    }
                    
                    let vc = self.storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC
                    vc.photos = photos
                    vc.videoURL = videoURL
                    picker.pushViewController(vc, animated: true)
                }
            }
            present(picker, animated: true)
            
            return false
        }
        return true
        
    }


}
