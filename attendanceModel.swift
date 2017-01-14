//
//  attendanceModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 11/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendanceModel: NSObject {
    
    var attendanceStatus:String?
    var markedStatus:String?
    var punchIn:String?
    var punchOut:String?
    var reason:String?
    
    init(attendanceStatusVal:String,markedStatusVal:String,punchInVal:String,punchOutVal:String,reasonVal:String) {
        self.attendanceStatus = attendanceStatusVal
        self.markedStatus = markedStatusVal
        self.punchIn = punchInVal
        self.punchOut = punchOutVal
        self.reason = reasonVal
    }

}
