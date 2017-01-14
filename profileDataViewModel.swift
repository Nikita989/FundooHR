//
//  profileDataViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class profileDataViewModel: NSObject,profileViewModelProtocal {
    
    var profileViewProc:profileViewProtocal?
    var profileValues:profileDataModel?
    let profileDataControllervar = profileDataController()

    func fetchProfileDataFromController()
    {
        profileDataControllervar.viewModelProctocolvar = self
        profileDataControllervar.fetchProfileDataFromServices()
        
        
    }
    
    
    func sendProfileDataToView(values:profileDataModel)
    {
        profileValues = values
        profileViewProc?.setProfileData()
    }
    
    func sendUpdatedProfileDataToController(profileData:profileDataModel)
    {
        profileDataControllervar.sendUpdatedProfileDataToController(profileData: profileData)
        
    }

}
