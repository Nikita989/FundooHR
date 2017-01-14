//
//  hrDataModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

class hrDataModel: NSObject {
    
    var startDateModel:String?
    var contractInitiatedModel:String?
    var contractSignedModel:String?
    var companyModel:String?
    var companyJoinDateModel:String?
    var companyLeaveDateModel:String?
    var contractSignDateModel:String?
    var employeeStatusModel:String?
    var enggContractInitiatedModel:String?
    var enggContractSignedModel:String?
    var fellowshipPeriodModel:String?
    var hiringCityModel:String?
    var initiateTransferModel:String?
    
    
    init(startDate:String,contractInitiated:String,contractSigned:String,company:String,companyJoinDate:String,companyLeaveDate:String,contractSignDate:String,employeeStatus:String,enggContractInitiated:String,enggContractSigned:String,fellowshipPeriod:String,hiringCity:String,initiateTransfer:String) {
        
        self.startDateModel = startDate
        self.contractInitiatedModel = contractInitiated
        self.contractSignedModel = contractSigned
        self.companyModel = company
        self.companyJoinDateModel = companyJoinDate
        self.companyLeaveDateModel = companyLeaveDate
        self.contractSignDateModel = contractSignDate
        self.employeeStatusModel = employeeStatus
        self.enggContractSignedModel = enggContractSigned
        self.enggContractInitiatedModel = enggContractInitiated
        self.fellowshipPeriodModel = fellowshipPeriod
        self.hiringCityModel = hiringCity
        self.initiateTransferModel = initiateTransfer
        
    }
   
   }
