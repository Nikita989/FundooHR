//
//  hrDataViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from hr data controller
//  2. sends hr data to view

//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class hrDataViewModel: NSObject,viewModelProtocol {
    
    // variable of type hr data model
    var hrValues:hrDataModel?
    
    // variable of type view controller
    var viewObj:ViewController?
    
    // variable of type hr view protocol
    var hrViewObj:hrviewProtocal?
    
    init(mHrViewProtocolObj:hrviewProtocal) {
        
        hrViewObj = mHrViewProtocolObj
    }
    
    // making call to controller to fetch hr data
    func fetchHrDataFromController()
    {
        // creating object of hr data controller
        let hrDataControllerVar = hrDataController(mHrViewModelProtocolObj: self)
        hrDataControllerVar.fetchHrDataFromServices()
    }
    
    // function to send fetched hr data to view
    func sendDataToView(values:hrDataModel)
    {
        hrValues = values
        hrViewObj?.sethrDataValues()
    }
    
    //  function to send updated data to hr controller
    func sendUpdatedHrDataToController(hrData:hrDataModel)
    {
        let hrDataControllerVar = hrDataController(mHrViewModelProtocolObj: self)
        hrDataControllerVar.sendUpdatedHrDataToServices(hrData: hrData)
    }
    
    
}
