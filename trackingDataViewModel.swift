//
//  trackingDataViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class trackingDataViewModel: NSObject,trackingViewModelProtocol {
    let trackingControllerObj = trackingController()
    var trackingValues:trackingDataModel?
    var trackingViewProc:trackingViewProtocol?
    
    func fetchTrackingDataFromController()
    {
        trackingControllerObj.trackingViewModelProtocalvar = self
        trackingControllerObj.fetchTrackingDataFromServices()
        
    }
    
    
    func sendTrackingDataToView(values:trackingDataModel)
    {
        trackingValues = values
        trackingViewProc?.setTrackingData()
    }
    
    func sendUpdatedTrackingDataToController(trackingData:trackingDataModel)
    {
        trackingControllerObj.sendUpdatedTrackingDataToServices(trackingData: trackingData)
    }
    
}
