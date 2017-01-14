//
//  trackingProtocol.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

protocol trackingViewModelProtocol {
    
    func sendTrackingDataToView(values:trackingDataModel)

}

protocol trackingControllerProtocol {
    
    func sendDataToViewModel(value:trackingDataModel)
}

protocol trackingViewProtocol {
    
    func setTrackingData()
}
