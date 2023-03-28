//
//  Protocols.swift
//  LittlePink
//
//  Created by 贾贾 on 2023/3/28.
//

import Foundation


protocol ChannelVCDelegate {
    //知识点：文档注释(documentation comments)
    //把下面的文档注释右击保存为代码片段code snippet，占位符的写法为<#，右边对称
    //注，参数个数必须对应上否则无法三指展示文档
    
    /// 用户从选择话题页面返回编辑笔记页面传值用
    /// - Parameter channel: 传回来的channel
    /// - Parameter subChannel: 传回来的subChannel
    func updateChannel(channel: String, subChannel: String)
}
