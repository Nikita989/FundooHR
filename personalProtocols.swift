//
//  personalProtocols.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

protocol personalControllerProtocal {
    
    func sendPersonalDataToViewModel(value:personalDataModel)
}

protocol personalViewModelProtocal {
    
    func sendPersonalDataToView(value:personalDataModel)
    
}

protocol personalviewProtocal {
    func setPersonalData ()
}
