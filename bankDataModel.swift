//
//  bankDataModel.swift
//  Fundo

//  purpose:
//  1. model class for bank data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankDataModel: NSObject {
    
    // variable of type string to store bank data values
    var accNumber:String?
    var bankName:String?
    var bankIfscCode:String?
    var bankPan:String?
    var BankPaySalary:String?
    var reason:String?
    
    
    // constructor of bank DataModel
    init(accountNum:String,bankNAme:String,ifscCode:String,pan:String,paySalary:String,reasonVar:String) {
        
        self.accNumber = accountNum
        self.bankName = bankNAme
        self.bankIfscCode = ifscCode
        self.bankPan = pan
        self.BankPaySalary = paySalary
        self.reason = reasonVar
        
    }
    
}
