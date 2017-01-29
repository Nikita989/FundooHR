//
//  personalDataController.swift
//  Fundo
//
//  1.fetches data from personal data services
//  2. sends personal data to view model
//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class personalDataController: NSObject,personalControllerProtocal {
    
    // variable of type personalViewModelProtocal
    var viewModelProtocalVar:personalViewModelProtocal?
    
    init(mPersonalProtocolObj:personalViewModelProtocal) {
        
        viewModelProtocalVar = mPersonalProtocolObj
    }
    
    // making call to services to fetch personal data
    func fetchPersonalDataFromServices()
    {
        // create object of personalDataServices
        let personalDataServicesVar = personalDataServices(mPersonalProtocolObj: self)
        personalDataServicesVar.fetchPersonalDataFromDatabase()
    }
    
    
    //send personal data to view model
    func sendPersonalDataToViewModel(value:personalDataModel)
    {
        viewModelProtocalVar?.sendPersonalDataToView(value: value)
    }
    
    // send updated personal data to services
    func sendUpdatedPersonalDataToServices(personalData:personalDataModel)
    {
        let personalDataServicesVar = personalDataServices(mPersonalProtocolObj: self)
        personalDataServicesVar.updatePersonalData(personalData: personalData)
        
    }
}
