//
//  Constants.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/20.
//

import UIKit

//MARK: - StoryboardID
let kFollowVCID = "FollowViewControllerID"
let kNearbyVCID = "NearbyViewControllerID"
let kDiscoverVCID = "DiscoverViewControllerID"
let kWaterfallVCID = "WaterfallVCID"
let kNoteEditVCID = "NoteEditVCID"
let kPhotoFooterID = "PhotoFooterID"
let kChannelTableVCID = "ChannelTableVCID"


//MARK: - Accets
let mainColor = UIColor(named: "main")!
let blueColor = UIColor(named: "blue")!
let imagePH = UIImage(named: "imagePH")!

//MARK: - coreDAta
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

//MARK: - CellID
let kWaterfallCellID = "WaterfallCellID"
let kPhotoCellID = "PhotoCellID"
let kSubChannelCellID = "SubChannelCellID"
let kdraftNoteWaterfallCellID = "DraftNoteWaterfallCellID"


let kWaterfallPadding: CGFloat = 4
let kChannels = ["Recommendation","Travel","Entertainment","Skill","Beauty","Fitness","Food","Pet"]

//MARK: - YPImagePicker
let kMaxPhotoCount = 9
let kMaxCameraZoomFactor: CGFloat = 5

//MARK: - Note
let kMaxNoteTitleCount = 50
let kMaxNoteTextCount = 2000

//MARK: - Topic
let kAllSubChannels = [
    ["Fashion and beauty","Food and cooking","Travel and tourism","Lifestyle and inspiration"],
    ["Solo traveling","Top travel destinations","Best beaches"],
    ["Celebrity gossip and news","Movie and TV show reviews","Music news and reviews"],
    ["DIY and home improvement projects","Language learning and tutoring"],
    ["Makeup tutorials and tips","Skincare routines and product reviews","Haircare tips and tutorials"],
    ["Workout routines and tutorials","Fitness challenges and competitions"],
    ["Recipe ideas and cooking tutorials","Healthy eating and nutrition advice","Food photography and styling tips","International cuisine and cultural foods"],
    ["Cute animal photos and videos","Pet care and health tips","Pet adoption"],

]
