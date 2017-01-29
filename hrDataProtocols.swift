//
//  protocals.swift
//  Fundo

//  purpose:
//  1. contrains protocols for Hr data view


//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

// protocol of Hr viewModel
protocol viewModelProtocol {
    
    func sendDataToView(values:hrDataModel)
    
}

// protocol of  HR controller
protocol controllerProtocal {
    
    func sendDataToViewModel(values:hrDataModel)
    
}

// protocol of  HR view
protocol hrviewProtocal {
    
    
    func sethrDataValues()
}

