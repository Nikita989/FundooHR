//
//  bankDataModel.swift
//  Fundo

//  purpose:
//  1. model class for bank data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class BankDataModel: NSObject {
    
    // variable of type string to store bank data values
    var mAccNumber:String?
    var mBankName:String?
    var mBankIfscCode:String?
    var mBankPan:String?
    var mBankPaySalary:String?
    var mReason:String?
    
    
    // constructor of bank DataModel
    init(accountNum:String,bankNAme:String,ifscCode:String,pan:String,paySalary:String,reasonVar:String) {
        
        self.mAccNumber = accountNum
        self.mBankName = bankNAme
        self.mBankIfscCode = ifscCode
        self.mBankPan = pan
        self.mBankPaySalary = paySalary
        self.mReason = reasonVar
        
    }
    
}
