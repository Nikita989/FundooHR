//
//  trackingDataModel.swift
//  Fundo

//  purpose:
//  1. model class for tracking data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class TrackingDataModel: NSObject {
    
    // variable of type string to store tracking data values
    var mEndDate:String?
    var mStartDate:String?
    var mCurrentWeek:String?
    var mNoOfWeeksLeft:String?
    var mTechStack:String?
    var mWeek:String?
    
    // constructor of tracking DataModel
    init(blEndDate:String,blStartDate:String,curWeek:String,numOfWeeks:String,stack:String,week1:String) {
        
        self.mEndDate = blEndDate
        self.mStartDate = blStartDate
        self.mCurrentWeek = curWeek
        self.mNoOfWeeksLeft = numOfWeeks
        self.mTechStack = stack
        self.mWeek = week1
    }
    
}
