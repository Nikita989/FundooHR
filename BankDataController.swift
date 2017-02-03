//
//  bankDataController.swift
//  Fundo
//
//  1.fetches data from bank data services
//  2. sends bank data to view model

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class BankDataController: NSObject,BankControllerProtocol {
    
    // variable of type bankViewModelProtocol
    var bankViewModelProtocal:BankViewModelProtocol?
    
    // contructor of bankDataController
    init(mBankControllerProtocolObj:BankViewModelProtocol) {
        bankViewModelProtocal = mBankControllerProtocolObj
    }
    
    // making call to services to fetch bank data
    func fetchDataFromServices()
    {
        let  bankDataServicesObj = BankDataServices(pBankControllerProtocolObj: self)
        bankDataServicesObj.fetchDataFromDataBase()
    }
    
    
    // send bank data to view model
    func sendDataToViewModel(value:BankDataModel)
    {
        bankViewModelProtocal?.sendDataToView(values: value)
    }
    
    
    // send updated bank data to services
    func sendUpdatedBankDataToServices(bankData:BankDataModel)
    {
        let  bankDataServicesObj = BankDataServices(pBankControllerProtocolObj: self)
        bankDataServicesObj.updateBankData(bankData: bankData)
    }
}
