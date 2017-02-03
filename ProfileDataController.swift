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

class ProfileDataController: NSObject,ProfileControllerProtocol {
    
    
    // variable of type profileViewModelProtocal
    var viewModelProctocolvar:ProfileViewModelProtocal?
    
    init(pProfileViewModelObj:ProfileViewModelProtocal) {
        
        viewModelProctocolvar = pProfileViewModelObj
    }
    
    // making call to services to fetch profile data
    
    func fetchProfileDataFromServices()
    {
        // create object of profileDataServices
        let profileDataServicesVar = ProfileDataServices(pProfileControllerProtocolObj: self)
        profileDataServicesVar.fetchProfileDataFromDataBase()
    }
    
    
    func sendProfileDatatoViewModel(value:ProfileDataModel)
    {
        viewModelProctocolvar?.sendProfileDataToView(values: value)
    }
    
    func sendUpdatedProfileDataToController(profileData:ProfileDataModel)
    {
        let profileDataServicesVar = ProfileDataServices(pProfileControllerProtocolObj: self)
        profileDataServicesVar.updateProfileData(profilData: profileData)
    }
}
