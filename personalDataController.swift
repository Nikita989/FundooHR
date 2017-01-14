//
//  personalDataController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class personalDataController: NSObject,personalControllerProtocal {

    var viewModelProtocalVar:personalViewModelProtocal?
    let personalDataServicesVar = personalDataServices()
    
    func fetchPersonalDataFromServices()
    {
        personalDataServicesVar.controllerProtocal = self
        personalDataServicesVar.fetchPersonalDataFromDatabase()
    }
    
    func sendPersonalDataToViewModel(value:personalDataModel)
    {
        viewModelProtocalVar?.sendPersonalDataToView(value: value)
    }
    
    func sendUpdatedPersonalDataToServices(personalData:personalDataModel)
    {
        personalDataServicesVar.updatePersonalData(personalData: personalData)
        
    }
}
