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

class PersonalDataController: NSObject,PersonalControllerProtocal {
    
    // variable of type personalViewModelProtocal
    var viewModelProtocalVar:PersonalViewModelProtocal?
    
    init(mPersonalProtocolObj:PersonalViewModelProtocal) {
        
        viewModelProtocalVar = mPersonalProtocolObj
    }
    
    // making call to services to fetch personal data
    func fetchPersonalDataFromServices()
    {
        // create object of personalDataServices
        let personalDataServicesVar = PersonalDataServices(mPersonalProtocolObj: self)
        personalDataServicesVar.fetchPersonalDataFromDatabase()
    }
    
    
    //send personal data to view model
    func sendPersonalDataToViewModel(value:PersonalDataModel)
    {
        viewModelProtocalVar?.sendPersonalDataToView(value: value)
    }
    
    // send updated personal data to services
    func sendUpdatedPersonalDataToServices(personalData:PersonalDataModel)
    {
        let personalDataServicesVar = PersonalDataServices(mPersonalProtocolObj: self)
        personalDataServicesVar.updatePersonalData(personalData: personalData)
        
    }
}
