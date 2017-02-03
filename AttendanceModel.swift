//
//  attendanceModel.swift
//  Fundo

//  purpose:
//  1. model class for attendance data

//  Created by BridgeLabz Solution LLP on 11/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class AttendanceModel: NSObject {
    
    // variable of type string to store attendance values
    var mAttendanceStatus:String?
    var mMarkedStatus:String?
    var mPunchIn:String?
    var mPunchOut:String?
    var mReason:String?
    
    
    // constructor of attendance Model
    init(attendanceStatusVal:String,markedStatusVal:String,punchInVal:String,punchOutVal:String,reasonVal:String) {
        self.mAttendanceStatus = attendanceStatusVal
        self.mMarkedStatus = markedStatusVal
        self.mPunchIn = punchInVal
        self.mPunchOut = punchOutVal
        self.mReason = reasonVal
    }
    
}
