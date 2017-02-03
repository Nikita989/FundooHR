//
//  enggInfoModel.swift
//  Fundo

//  purpose:
//  1. model class for engineer data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class EnggInfoModel: NSObject {
    
    // variable of type string to store engineer info  values
    var mEmpName:String?
    var mEmpStatus:String?
    var mCompany:String?
    var mMobile:String?
    var mEmailId:String?
    var mStartDate:String?
    var mCmpJoinDate:String?
    var mCmpLeaveDate:String?
    var mLeaveTaken:Int!
    var mEmpImage:String!
    
    // constructor of enggInfoModel
    init(employeeName:String,employeeStatus:String,cmp:String,empMobile:String,empEmail:String,empStartDate:String,joinDate:String,leaveDate:String,leaves:Int,employeeImage:String) {
        
        self.mEmpName = employeeName
        self.mEmpStatus = employeeStatus
        self.mCompany = cmp
        self.mMobile = empMobile
        self.mEmailId = empEmail
        self.mStartDate = empStartDate
        self.mCmpJoinDate = joinDate
        self.mCmpLeaveDate = leaveDate
        self.mLeaveTaken = leaves
        self.mEmpImage = employeeImage
        
    }
    
    
}
