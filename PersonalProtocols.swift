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
protocol PersonalControllerProtocal {
    
    func sendPersonalDataToViewModel(value:PersonalDataModel)
}


// protocol of personalViewModel
protocol PersonalViewModelProtocal {
    
    func sendPersonalDataToView(value:PersonalDataModel)
    
}


// protocol of personalviewProtocal
protocol PersonalviewProtocal {
    func setPersonalData ()
    
}
