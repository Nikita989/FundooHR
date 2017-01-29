//
//  trackingProtocol.swift
//  Fundo

//  purpose:
//  1. contrains protocols for tracking view


//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

// protocol of  tracking view model
protocol trackingViewModelProtocol {
    
    func sendTrackingDataToView(values:trackingDataModel)
    
}

// protocol of  tracking controller
protocol trackingControllerProtocol {
    
    func sendDataToViewModel(value:trackingDataModel)
}

// protocol of  tracking view
protocol trackingViewProtocol {
    
    func setTrackingData()
}
