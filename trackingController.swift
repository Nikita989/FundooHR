//
//  trackingController.swift
//  Fundo
//
//  1.fetches data from tracking data services
//  2. sends tracking data to view model

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class trackingController: NSObject,trackingControllerProtocol {
    
    // variable of type trackingViewModelProtocol
    var trackingViewModelProtocalvar:trackingViewModelProtocol?
    
    // constructor of trackingController
    init(pTrackingViewModelProtocolObj:trackingViewModelProtocol) {
        
        trackingViewModelProtocalvar = pTrackingViewModelProtocolObj
    }
    
    // making call to services to fetch tracking data
    func fetchTrackingDataFromServices()
    {
        let tracklingServicesObj = trackingServices(pTrackingControllerProtocolObj: self)
        tracklingServicesObj.fetchDataFromDataBase()
    }
    
    // send tracking to view model
    func sendDataToViewModel(value:trackingDataModel)
    {
        trackingViewModelProtocalvar?.sendTrackingDataToView(values: value)
        
    }
    
    // send updated tracking data to services
    func sendUpdatedTrackingDataToServices(trackingData:trackingDataModel)
    {
        let tracklingServicesObj = trackingServices(pTrackingControllerProtocolObj: self)
        tracklingServicesObj.updateTrackingData(trackingData: trackingData)
        
    }
}

