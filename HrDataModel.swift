//
//  hrDataModel.swift
//  Fundo

//  purpose:
//  1. model class for hr data

//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

class HrDataModel: NSObject {
    
    // variable of type string to store hr data values
    var mStartDateModel:String?
    var mContractInitiatedModel:String?
    var mContractSignedModel:String?
    var mCompanyModel:String?
    var mCompanyJoinDateModel:String?
    var mCompanyLeaveDateModel:String?
    var mContractSignDateModel:String?
    var mEmployeeStatusModel:String?
    var mEnggContractInitiatedModel:String?
    var mEnggContractSignedModel:String?
    var mFellowshipPeriodModel:String?
    var mHiringCityModel:String?
    var mInitiateTransferModel:String?
    
    // constructor of hrDataModel
    init(startDate:String,contractInitiated:String,contractSigned:String,company:String,companyJoinDate:String,companyLeaveDate:String,contractSignDate:String,employeeStatus:String,enggContractInitiated:String,enggContractSigned:String,fellowshipPeriod:String,hiringCity:String,initiateTransfer:String) {
        
        self.mStartDateModel = startDate
        self.mContractInitiatedModel = contractInitiated
        self.mContractSignedModel = contractSigned
        self.mCompanyModel = company
        self.mCompanyJoinDateModel = companyJoinDate
        self.mCompanyLeaveDateModel = companyLeaveDate
        self.mContractSignDateModel = contractSignDate
        self.mEmployeeStatusModel = employeeStatus
        self.mEnggContractSignedModel = enggContractSigned
        self.mEnggContractInitiatedModel = enggContractInitiated
        self.mFellowshipPeriodModel = fellowshipPeriod
        self.mHiringCityModel = hiringCity
        self.mInitiateTransferModel = initiateTransfer
        
    }
    
}
