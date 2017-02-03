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
protocol ViewModelProtocol {
    
    func sendDataToView(values:HrDataModel)
    
}

// protocol of  HR controller
protocol ControllerProtocal {
    
    func sendDataToViewModel(values:HrDataModel)
    
}

// protocol of  HR view
protocol HrviewProtocal {
    
    
    func sethrDataValues()
}

