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

class TrackingController: NSObject,TrackingControllerProtocol {
    
    // variable of type trackingViewModelProtocol
    var trackingViewModelProtocalvar:TrackingViewModelProtocol?
    
    // constructor of trackingController
    init(pTrackingViewModelProtocolObj:TrackingViewModelProtocol) {
        
        trackingViewModelProtocalvar = pTrackingViewModelProtocolObj
    }
    
    // making call to services to fetch tracking data
    func fetchTrackingDataFromServices()
    {
        let tracklingServicesObj = TrackingServices(pTrackingControllerProtocolObj: self)
        tracklingServicesObj.fetchDataFromDataBase()
    }
    
    // send tracking to view model
    func sendDataToViewModel(value:TrackingDataModel)
    {
        trackingViewModelProtocalvar?.sendTrackingDataToView(values: value)
        
    }
    
    // send updated tracking data to services
    func sendUpdatedTrackingDataToServices(trackingData:TrackingDataModel)
    {
        let tracklingServicesObj = TrackingServices(pTrackingControllerProtocolObj: self)
        tracklingServicesObj.updateTrackingData(trackingData: trackingData)
        
    }
}

