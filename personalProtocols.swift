//
//  personalProtocols.swift
//  Fundo

//  purpose:
//  1. contrains protocols for personal view

//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

// protocol of personalController
protocol personalControllerProtocal {
    
    func sendPersonalDataToViewModel(value:personalDataModel)
}


// protocol of personalViewModel
protocol personalViewModelProtocal {
    
    func sendPersonalDataToView(value:personalDataModel)
    
}


// protocol of personalviewProtocal
protocol personalviewProtocal {
    func setPersonalData ()
    
}
