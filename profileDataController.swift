//
//  profileDataController.swift
//  Fundo
//
//  1.fetches data from profile data services
//  2. sends profile data to view

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class profileDataController: NSObject,profileControllerProtocol {
    
    
    // variable of type profileViewModelProtocal
    var viewModelProctocolvar:profileViewModelProtocal?
    
    init(pProfileViewModelObj:profileViewModelProtocal) {
        
        viewModelProctocolvar = pProfileViewModelObj
    }
    
    // making call to services to fetch profile data
    
    func fetchProfileDataFromServices()
    {
        // create object of profileDataServices
        let profileDataServicesVar = profileDataServices(pProfileControllerProtocolObj: self)
        profileDataServicesVar.fetchProfileDataFromDataBase()
    }
    
    
    func sendProfileDatatoViewModel(value:profileDataModel)
    {
        viewModelProctocolvar?.sendProfileDataToView(values: value)
    }
    
    func sendUpdatedProfileDataToController(profileData:profileDataModel)
    {
        let profileDataServicesVar = profileDataServices(pProfileControllerProtocolObj: self)
        profileDataServicesVar.updateProfileData(profilData: profileData)
    }
}
