//
//  enggInfoModel.swift
//  Fundo

//  purpose:
//  1. model class for engineer data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoModel: NSObject {
    
    // variable of type string to store engineer info  values
    var empName:String?
    var empStatus:String?
    var company:String?
    var mobile:String?
    var emailId:String?
    var startDate:String?
    var cmpJoinDate:String?
    var cmpLeaveDate:String?
    var leaveTaken:Int!
    var empImage:String!
    
    // constructor of enggInfoModel
    init(employeeName:String,employeeStatus:String,cmp:String,empMobile:String,empEmail:String,empStartDate:String,joinDate:String,leaveDate:String,leaves:Int,employeeImage:String) {
        
        self.empName = employeeName
        self.empStatus = employeeStatus
        self.company = cmp
        self.mobile = empMobile
        self.emailId = empEmail
        self.startDate = empStartDate
        self.cmpJoinDate = joinDate
        self.cmpLeaveDate = leaveDate
        self.leaveTaken = leaves
        self.empImage = employeeImage
        
    }
    
    
}
