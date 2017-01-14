//
//  protocals.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

protocol viewModelProtocol {
    
    func sendDataToView(values:hrDataModel)
    
}

protocol controllerProtocal {
    
     func sendDataToViewModel(values:hrDataModel)
    
}

protocol hrviewProtocal {
    
    
    func sethrDataValues()
}

