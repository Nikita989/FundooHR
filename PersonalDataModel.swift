//
//  personalDataModel.swift
//  Fundo

//  purpose:
//  1. model class for personal data

//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class PersonalDataModel: NSObject {
    
    // variable of type string to store personal data values
    var mAnnualSalaryModel:String?
    var mDateOfBirthModel:String?
    var mEmailIdModel:String?
    var mEmployeeNameModel:String?
    var mFatherMobileModel:String?
    var mFatherNameModel:String?
    var mMobileModel:String?
    var mMumbaiAddressModel:String?
    var mOccupationModel:String?
    var mPermenantAddress:String?
    
    // constructor of personal DataModel
    init(annualSalary:String,dob:String,email:String,empName:String,fatherMobile:String,fatherName:String,mobile:String,mumbaiAddr:String,occupation:String,permanantAddr:String) {
        self.mAnnualSalaryModel = annualSalary
        self.mDateOfBirthModel = dob
        self.mEmailIdModel = email
        self.mEmployeeNameModel = empName
        self.mFatherNameModel = fatherName
        self.mFatherMobileModel = fatherMobile
        self.mMobileModel = mobile
        self.mMumbaiAddressModel = mumbaiAddr
        self.mOccupationModel = occupation
        self.mPermenantAddress = permanantAddr
        
        
        
    }
    
}
