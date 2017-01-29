//
//  trackingDataModel.swift
//  Fundo

//  purpose:
//  1. model class for tracking data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class trackingDataModel: NSObject {
    
    // variable of type string to store tracking data values
    var endDate:String?
    var startDate:String?
    var currentWeek:String?
    var noOfWeeksLeft:String?
    var techStack:String?
    var week:String?
    
    // constructor of tracking DataModel
    init(blEndDate:String,blStartDate:String,curWeek:String,numOfWeeks:String,stack:String,week1:String) {
        
        self.endDate = blEndDate
        self.startDate = blStartDate
        self.currentWeek = curWeek
        self.noOfWeeksLeft = numOfWeeks
        self.techStack = stack
        self.week = week1
    }
    
}
