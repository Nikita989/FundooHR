//
//  enggInfoController.swift

//  Fundo
//  1.fetches data from engg info services
//  2. sends engg info to view model

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoController: NSObject,enggInfoControllerProtocol {
    
    // variable of type enggInfoViewModelProtocol
    var enggViewModelProtocol:enggInfoViewModelProtocol?
    
    // constructor of enggInfoController
    init(pEnggInfoViewModelProtocolObj:enggInfoViewModelProtocol) {
        
        enggViewModelProtocol = pEnggInfoViewModelProtocolObj
        
    }
    
    // making call to services to fetch Engineer info
    func fetchDataFromServices()
    {
        let enggInfoServicesObj = enggInfoServices(pEnggControllerProtocolObj: self)
        enggInfoServicesObj.fetchDataFromDataBase()
    }
    
    // send Engineer info to view model
    func sendDataToViewModel(value:enggInfoModel)
    {
        enggViewModelProtocol?.sendDataToView(values: value)
    }
    
}
