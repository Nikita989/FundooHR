//
//  trackingController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class trackingController: NSObject,trackingControllerProtocol {

    var trackingViewModelProtocalvar:trackingViewModelProtocol?
    let tracklingServicesObj = trackingServices()

    func fetchTrackingDataFromServices()
    {
        tracklingServicesObj.trackingControllerProtocal = self
        tracklingServicesObj.fetchDataFromDataBase()
    }
    
    func sendDataToViewModel(value:trackingDataModel)
    {
        trackingViewModelProtocalvar?.sendTrackingDataToView(values: value)
        
    }
    func sendUpdatedTrackingDataToServices(trackingData:trackingDataModel)
    {
        tracklingServicesObj.updateTrackingData(trackingData: trackingData)
        
    }
}

