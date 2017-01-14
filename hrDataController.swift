//
//  hrDataController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class hrDataController: NSObject,controllerProtocal {
    
    var hrViewModelProtocol:viewModelProtocol?
    let hrDataServicesVar = hrDataServices()
    
    func fetchHrDataFromServices()
    {
        hrDataServicesVar.hrDataContProtocal = self
        hrDataServicesVar.fetchHrDataFromDatabase()
        
    }
    
    func sendDataToViewModel(values:hrDataModel)
    {
        hrViewModelProtocol?.sendDataToView(values:values)
        
    }

    func sendUpdatedHrDataToServices(hrData:hrDataModel)
    {
        hrDataServicesVar.updateHrData(hrData: hrData)
        
    }
}
