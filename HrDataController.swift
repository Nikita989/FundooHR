//
//  hrDataController.swift
//  Fundo:
//  1.fetches data from hr data services
//  2. sends hr data to view model
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class HrDataController: NSObject,ControllerProtocal {
    
    // variable of type viewModelProtocol
    var hrViewModelProtocol:ViewModelProtocol?
    
    init(mHrViewModelProtocolObj:ViewModelProtocol) {
        
        hrViewModelProtocol = mHrViewModelProtocolObj
    }
    
    // making call to services to fetch hr data
    func fetchHrDataFromServices()
    {
        // creating object of hrDataServices
        let hrDataServicesVar = HrDataServices(mHrControllerProtocolObj: self)
        hrDataServicesVar.fetchHrDataFromDatabase()
    }
    
    
    // send hr data to view model
    func sendDataToViewModel(values:HrDataModel)
    {
        hrViewModelProtocol?.sendDataToView(values:values)
    }
    
    
    // send updated hr data to view model
    func sendUpdatedHrDataToServices(hrData:HrDataModel)
    {
        let hrDataServicesVar = HrDataServices(mHrControllerProtocolObj: self)
        hrDataServicesVar.updateHrData(hrData: hrData)
    }
}
