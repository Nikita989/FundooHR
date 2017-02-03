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

class TrackingDataViewModel: NSObject,TrackingViewModelProtocol {
    
    
    // variable of type tracking data model
    var mTrackingValues:TrackingDataModel?
    
    // variable of type tracking view protocol
    var mTrackingViewProc:TrackingViewProtocol?
    
    
    init(trackingViewProtocolObj:TrackingViewProtocol) {
        
        mTrackingViewProc = trackingViewProtocolObj
    }
    
    
    // making call to controller to fetch tracking data
    func fetchTrackingDataFromController()
    {
        // creating object of tracking controller
        let trackingControllerObj = TrackingController(pTrackingViewModelProtocolObj: self)
        trackingControllerObj.fetchTrackingDataFromServices()
    }
    
    // function to send fetched tracking data to view
    func sendTrackingDataToView(values:TrackingDataModel)
    {
        mTrackingValues = values
        mTrackingViewProc?.setTrackingData()
    }
    
    //  function to send updated data to tracking controller
    func sendUpdatedTrackingDataToController(trackingData:TrackingDataModel)
    {
        let trackingControllerObj = TrackingController(pTrackingViewModelProtocolObj: self)
        trackingControllerObj.sendUpdatedTrackingDataToServices(trackingData: trackingData)
    }
    
}
