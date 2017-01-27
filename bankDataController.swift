//
//  bankDataController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankDataController: NSObject,bankControllerProtocol {

    var bankViewModelProtocal:bankViewModelProtocol?
    let  bankDataServicesObj = bankDataServices()
    
    func fetchDataFromServices()
    {
       bankDataServicesObj.bankControllerProtocol = self
        bankDataServicesObj.fetchDataFromDataBase()
    }
    
    func sendDataToViewModel(value:bankDataModel)
    {
        bankViewModelProtocal?.sendDataToView(values: value)
    }
    
    func sendUpdatedBankDataToServices(bankData:bankDataModel)
    {
        bankDataServicesObj.updateBankData(bankData: bankData)
    }
}
