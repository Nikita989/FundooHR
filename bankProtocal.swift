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
protocol bankViewModelProtocol {
    
    func sendDataToView(values:bankDataModel)
    
}

// protocol of  bank controller
protocol bankControllerProtocol {
    
    func sendDataToViewModel(value:bankDataModel)
    
}

// protocol of  bank view
protocol bankviewProtocol{
    
    func setBankData()
    
}
