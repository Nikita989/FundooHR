//
//  attendancePopUpModel.swift
//  Fundo

//  purpose:
//  1. model class for attendance popup view

//  Created by BridgeLabz Solution LLP on 13/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class AttendancePopUpModel: NSObject {
    
    // variable of type string to store attendance popup values
    var mTimeStamp:String?
    var mEngineerId:String?
    var mAttendanceStatus:String?
    var mMarkedStatus:String?
    var mPunchIn:String?
    var mPunchOut:String?
    var mReason:String?
    
    // constructor of attendance popup Model
    init(timeStampVar:String,enggId:String,attendanceStatusVar:String,markedStatusVar:String,punchInVar:String,punchOutVar:String,reasonVar:String) {
        
        self.mTimeStamp = timeStampVar
        self.mEngineerId = enggId
        self.mAttendanceStatus = attendanceStatusVar
        self.mMarkedStatus = markedStatusVar
        self.mPunchIn = punchInVar
        self.mPunchOut = punchOutVar
        self.mReason = reasonVar
    }
    
}
