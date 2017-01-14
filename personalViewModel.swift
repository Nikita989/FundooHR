//
//  personalViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class personalViewModel: NSObject,personalViewModelProtocal {
    
    var personalValues:personalDataModel?
    var personalProtocal:personalviewProtocal?
    let personalDataControllerVar = personalDataController()
    
    func fetchPersonalDataFromController()
    {
        personalDataControllerVar.viewModelProtocalVar = self
        personalDataControllerVar.fetchPersonalDataFromServices()
        
    }

    func sendPersonalDataToView(value:personalDataModel)
    {
        
        personalValues = value
        personalProtocal?.setPersonalData()
        
    }
    func sendUpdatedPersonalDataToController(personalData:personalDataModel)
    {
        personalDataControllerVar.sendUpdatedPersonalDataToServices(personalData: personalData)
        
    }
}
