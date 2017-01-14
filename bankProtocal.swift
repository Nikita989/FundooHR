//
//  bankProtocal.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

protocol bankViewModelProtocol {
    
func sendDataToView(values:bankDataModel)
    
}

protocol bankControllerProtocol {
    
    func sendDataToViewModel(value:bankDataModel)

}

protocol bankviewProtocol{
    
        func setBankData()

}
