//
//  hrDataViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class hrDataViewModel: NSObject,viewModelProtocol {
    
    var hrValues:hrDataModel?
    var viewObj:ViewController?
    var hrViewObj:hrviewProtocal?
    let hrDataControllerVar = hrDataController()
    
    func fetchHrDataFromController()
    {
        hrDataControllerVar.hrViewModelProtocol = self
        hrDataControllerVar.fetchHrDataFromServices()
       
    }

    func sendDataToView(values:hrDataModel)
        
    {
        hrValues = values
        hrViewObj?.sethrDataValues()
        
        
    }
    
    func sendUpdatedHrDataToController(hrData:hrDataModel)
    {
        
        hrDataControllerVar.sendUpdatedHrDataToServices(hrData: hrData)
    }
    
    
}
