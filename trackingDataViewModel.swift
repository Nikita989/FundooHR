//
//  trackingDataViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from tracking data controller
//  2. sends tracking data to view

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class trackingDataViewModel: NSObject,trackingViewModelProtocol {
    
    // creating object of tracking controller
    let trackingControllerObj = trackingController()
    
    // variable of type tracking data model
    var trackingValues:trackingDataModel?
    
    // variable of type tracking view protocol
    var trackingViewProc:trackingViewProtocol?
    
    
    // making call to controller to fetch tracking data
    func fetchTrackingDataFromController()
    {
        trackingControllerObj.trackingViewModelProtocalvar = self
        trackingControllerObj.fetchTrackingDataFromServices()
    }
    
    // function to send fetched tracking data to view
    func sendTrackingDataToView(values:trackingDataModel)
    {
        trackingValues = values
        trackingViewProc?.setTrackingData()
    }
    
    //  function to send updated data to tracking controller
    func sendUpdatedTrackingDataToController(trackingData:trackingDataModel)
    {
        trackingControllerObj.sendUpdatedTrackingDataToServices(trackingData: trackingData)
    }
    
}
