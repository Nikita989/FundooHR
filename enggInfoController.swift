//
//  enggInfoController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoController: NSObject,enggInfoControllerProtocol {

    var enggViewModelProtocol:enggInfoViewModelProtocol?
    
    func fetchDataFromServices()
    {
     
     let enggInfoServicesObj = enggInfoServices()
        enggInfoServicesObj.enggControllerProtocol = self
        enggInfoServicesObj.fetchDataFromDataBase()
        
    }
    
    func sendDataToViewModel(value:enggInfoModel)
    {
        enggViewModelProtocol?.sendDataToView(values: value)
        
    }

}
