//
//  ProjectHistory.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/10/22.
//

import Foundation

class ProjecyHistory{
    var katagoryName:String?
    var projectName:String?
    var totalTime:Int?
    var startDate:Int?
    var endDate:Int?
    var coloCode:String?
    var play:Bool?
    
    init(katagoryName: String? = nil, projectName: String? = nil, totalTime: Int? = nil, startDate: Int? = nil, endDate: Int? = nil, coloCode: String? = nil, play: Bool? = nil) {
        self.katagoryName = katagoryName
        self.projectName = projectName
        self.totalTime = totalTime
        self.startDate = startDate
        self.endDate = endDate
        self.coloCode = coloCode
        self.play = play
    }
    
    init(){
        
    }
}
