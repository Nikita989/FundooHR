//
//  hrDataController.swift
//  Fundo:
//  1.fetches data from hr data services
//  2. sends hr data to view model
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class hrDataController: NSObject,controllerProtocal {
    
    // variable of type viewModelProtocol
    var hrViewModelProtocol:viewModelProtocol?
    
    init(mHrViewModelProtocolObj:viewModelProtocol) {
        
        hrViewModelProtocol = mHrViewModelProtocolObj
    }
    
    // making call to services to fetch hr data
    func fetchHrDataFromServices()
    {
        // creating object of hrDataServices
        let hrDataServicesVar = hrDataServices(mHrControllerProtocolObj: self)
        hrDataServicesVar.fetchHrDataFromDatabase()
    }
    
    
    // send hr data to view model
    func sendDataToViewModel(values:hrDataModel)
    {
        hrViewModelProtocol?.sendDataToView(values:values)
    }
    
    
    // send updated hr data to view model
    func sendUpdatedHrDataToServices(hrData:hrDataModel)
    {
        let hrDataServicesVar = hrDataServices(mHrControllerProtocolObj: self)
        hrDataServicesVar.updateHrData(hrData: hrData)
    }
}
