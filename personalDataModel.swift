//
//  personalDataModel.swift
//  Fundo

//  purpose:
//  1. model class for personal data

//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class personalDataModel: NSObject {
    
    // variable of type string to store personal data values
    var annualSalaryModel:String?
    var dateOfBirthModel:String?
    var emailIdModel:String?
    var employeeNameModel:String?
    var fatherMobileModel:String?
    var fatherNameModel:String?
    var mobileModel:String?
    var mumbaiAddressModel:String?
    var occupationModel:String?
    var permenantAddress:String?
    
    // constructor of personal DataModel
    init(annualSalary:String,dob:String,email:String,empName:String,fatherMobile:String,fatherName:String,mobile:String,mumbaiAddr:String,occupation:String,permanantAddr:String) {
        self.annualSalaryModel = annualSalary
        self.dateOfBirthModel = dob
        self.emailIdModel = email
        self.employeeNameModel = empName
        self.fatherNameModel = fatherName
        self.fatherMobileModel = fatherMobile
        self.mobileModel = mobile
        self.mumbaiAddressModel = mumbaiAddr
        self.occupationModel = occupation
        self.permenantAddress = permanantAddr
        
        
        
    }
    
}
