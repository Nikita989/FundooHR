//
//  bankViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankViewModel: NSObject,bankViewModelProtocol{

       var bankvalues:bankDataModel?
       let bankControllerObj = bankDataController()
       var viewControllerProc:bankviewProtocol?

    func fetchDataFromController()
    {
        bankControllerObj.bankViewModelProtocal = self
        bankControllerObj.fetchDataFromServices()
    }
    
 
    func sendDataToView(values:bankDataModel)
    {
        bankvalues = values
        viewControllerProc?.setBankData()
        
    }
    
    func sendUpdatedBankDataToController(bankData:bankDataModel)
    {
        
        bankControllerObj.sendUpdatedBankDataToServices(bankData: bankData)
        
    }

}
