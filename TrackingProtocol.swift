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
protocol TrackingViewModelProtocol {
    
    func sendTrackingDataToView(values:TrackingDataModel)
    
}

// protocol of  tracking controller
protocol TrackingControllerProtocol {
    
    func sendDataToViewModel(value:TrackingDataModel)
}

// protocol of  tracking view
protocol TrackingViewProtocol {
    
    func setTrackingData()
}
