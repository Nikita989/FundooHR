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

class PersonalViewModel: NSObject,PersonalViewModelProtocal {
    
    // variable of type personal data model
    var mPersonalValues:PersonalDataModel?
    
    // variable of type personal view protocol
    var mPersonalProtocal:PersonalviewProtocal?
    
    
    init(mPersonalViewProtocolObj:PersonalviewProtocal) {
        
        mPersonalProtocal = mPersonalViewProtocolObj
    }
    
    
    // making call to controller to fetch personal data
    func fetchPersonalDataFromController()
    {
        // creating object of personal data controller
        let personalDataControllerVar = PersonalDataController(mPersonalProtocolObj: self)
        personalDataControllerVar.fetchPersonalDataFromServices()
    }
    
    
    // function to send fetched personal data to view
    func sendPersonalDataToView(value:PersonalDataModel)
    {
        mPersonalValues = value
        mPersonalProtocal?.setPersonalData()
    }
    
    
    //  function to send updated data to personal controller
    func sendUpdatedPersonalDataToController(personalData:PersonalDataModel)
    {
        let personalDataControllerVar = PersonalDataController(mPersonalProtocolObj: self)
        personalDataControllerVar.sendUpdatedPersonalDataToServices(personalData: personalData)
    }
}
