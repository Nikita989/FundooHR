//
//  bankProtocal.swift
//  Fundo

//  purpose:
//  1. contrains protocols for bank view


//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation


// protocol of  bank view model
protocol BankViewModelProtocol {
    
    func sendDataToView(values:BankDataModel)
    
}

// protocol of  bank controller
protocol BankControllerProtocol {
    
    func sendDataToViewModel(value:BankDataModel)
    
}

// protocol of  bank view
protocol BankviewProtocol{
    
    func setBankData()
    
}
