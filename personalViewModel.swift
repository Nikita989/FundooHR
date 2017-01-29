//
//  personalViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from personal data controller
//  2. sends personal data to view

//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class personalViewModel: NSObject,personalViewModelProtocal {
    
    // variable of type personal data model
    var personalValues:personalDataModel?
    
    // variable of type personal view protocol
    var personalProtocal:personalviewProtocal?
    
    
    init(mPersonalViewProtocolObj:personalviewProtocal) {
        
        personalProtocal = mPersonalViewProtocolObj
    }
    
    
    // making call to controller to fetch personal data
    func fetchPersonalDataFromController()
    {
        // creating object of personal data controller
        let personalDataControllerVar = personalDataController(mPersonalProtocolObj: self)
        personalDataControllerVar.fetchPersonalDataFromServices()
    }
    
    
    // function to send fetched personal data to view
    func sendPersonalDataToView(value:personalDataModel)
    {
        personalValues = value
        personalProtocal?.setPersonalData()
    }
    
    
    //  function to send updated data to personal controller
    func sendUpdatedPersonalDataToController(personalData:personalDataModel)
    {
        let personalDataControllerVar = personalDataController(mPersonalProtocolObj: self)
        personalDataControllerVar.sendUpdatedPersonalDataToServices(personalData: personalData)
    }
}
