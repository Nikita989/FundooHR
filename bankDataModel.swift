//
//  bankDataModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankDataModel: NSObject {
    
    var accNumber:String?
    var bankName:String?
    var bankIfscCode:String?
    var bankPan:String?
    var BankPaySalary:String?
    var reason:String?
    
    
    init(accountNum:String,bankNAme:String,ifscCode:String,pan:String,paySalary:String,reasonVar:String) {
        
    self.accNumber = accountNum
    self.bankName = bankNAme
    self.bankIfscCode = ifscCode
    self.bankPan = pan
    self.BankPaySalary = paySalary
    self.reason = reasonVar
    
    }

}
