//
//  enggInfoModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoModel: NSObject {

    var empName:String?
    var empStatus:String?
    var company:String?
    var mobile:String?
    var emailId:String?
    var startDate:String?
    var cmpJoinDate:String?
    var cmpLeaveDate:String?
    var leaveTaken:Int!
    
    init(employeeName:String,employeeStatus:String,cmp:String,empMobile:String,empEmail:String,empStartDate:String,joinDate:String,leaveDate:String,leaves:Int) {
        
        self.empName = employeeName
        self.empStatus = employeeStatus
        self.company = cmp
        self.mobile = empMobile
        self.emailId = empEmail
        self.startDate = empStartDate
        self.cmpJoinDate = joinDate
        self.cmpLeaveDate = leaveDate
        self.leaveTaken = leaves
        
    }
    
    
}
