//
//  attendancePopUpModel.swift
//  Fundo

//  purpose:
//  1. model class for attendance popup view

//  Created by BridgeLabz Solution LLP on 13/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendancePopUpModel: NSObject {
    
    // variable of type string to store attendance popup values
    var timeStamp:String?
    var engineerId:String?
    var attendanceStatus:String?
    var markedStatus:String?
    var punchIn:String?
    var punchOut:String?
    var reason:String?
    
    // constructor of attendance popup Model
    init(timeStampVar:String,enggId:String,attendanceStatusVar:String,markedStatusVar:String,punchInVar:String,punchOutVar:String,reasonVar:String) {
        
        self.timeStamp = timeStampVar
        self.engineerId = enggId
        self.attendanceStatus = attendanceStatusVar
        self.markedStatus = markedStatusVar
        self.punchIn = punchInVar
        self.punchOut = punchOutVar
        self.reason = reasonVar
    }
    
}
