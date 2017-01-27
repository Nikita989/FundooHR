//
//  profileDataController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class profileDataController: NSObject,profileControllerProtocol {

    let profileDataServicesVar = profileDataServices()
    var viewModelProctocolvar:profileViewModelProtocal?
    
    func fetchProfileDataFromServices()
    {
        profileDataServicesVar.controllerProtocol = self
        profileDataServicesVar.fetchProfileDataFromDataBase()
    }
    
    func sendProfileDatatoViewModel(value:profileDataModel)
    {
        viewModelProctocolvar?.sendProfileDataToView(values: value)
    }
    
    func sendUpdatedProfileDataToController(profileData:profileDataModel)
    {
        profileDataServicesVar.updateProfileData(profilData: profileData)
    }
}
