//
//  ChannelTableVC.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/27.
//

import UIKit
import XLPagerTabStrip

class ChannelTableVC: UITableViewController {
    
    var channel = ""
    var subChannels: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        subChannels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubChannelCellID", for: indexPath)

        cell.textLabel?.text = "# \(subChannels[indexPath.row])"
        cell.textLabel?.font = .systemFont(ofSize: 15)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let channelVC = parent as! ChannelVC
        channelVC.PVDelegate?.updateChannel(channel: channel, subChannel: subChannels[indexPath.row])
        
        //print(presentingViewController)
        //Based on the present and dismiss mechanism, the presentingViewController of the child view controller is the same as the parent view controller (in this case, NoteEditVC)
        //So using dismiss here is equivalent to using dismiss directly in the parent view controller
        dismiss(animated: true)
    }


}

extension ChannelTableVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel)
    }
}
