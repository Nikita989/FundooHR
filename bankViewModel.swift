//
//  bankViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from bank data controller
//  2. sends bank data to view

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankViewModel: NSObject,bankViewModelProtocol{
    
    // variable of type bank data model
    var bankvalues:bankDataModel?
    
    
    // variable of type bank view protocol
    var viewControllerProc:bankviewProtocol?
    
    init(mBankViewProtocolObj:bankviewProtocol) {
        
        viewControllerProc = mBankViewProtocolObj
    }
    
    
    // making call to controller to fetch bank data
    func fetchDataFromController()
    {
        // creating object of bank data controller
        let bankControllerObj = bankDataController(mBankControllerProtocolObj: self)
        bankControllerObj.fetchDataFromServices()
        
    }
    
    // function to send fetched bank data to view
    func sendDataToView(values:bankDataModel)
    {
        bankvalues = values
        viewControllerProc?.setBankData()
    }
    
    //  function to send updated data to bank controller
    func sendUpdatedBankDataToController(bankData:bankDataModel)
    {
        let bankControllerObj = bankDataController(mBankControllerProtocolObj: self)
        bankControllerObj.sendUpdatedBankDataToServices(bankData: bankData)
    }
    
}
