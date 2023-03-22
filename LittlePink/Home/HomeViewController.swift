//
//  HomeViewController.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/20.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        //setting codes must write before viewDidLoad
        //1. I set bar in storyboard
        //2. selectedBar - the line below the button
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        //3. buttonBarItem - the button about text or image
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemLeftRightMargin = 0

        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = UIColor.white
        }
    }
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearbyVCID)
        let discoverVC = storyboard!.instantiateViewController(identifier: kDiscoverVCID)
        
        return[followVC, nearbyVC, discoverVC]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
