//
//  profileDataViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from profile data controller
//  2. sends profile data to view

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class ProfileDataViewModel: NSObject,ProfileViewModelProtocal {
    
    // variable of type profile view protocol
    var profileViewProc:ProfileViewProtocal?
    
    // variable of type profile data model
    var profileValues:ProfileDataModel?
    
    init(mProfileViewProtocolObj:ProfileViewProtocal) {
        
        profileViewProc = mProfileViewProtocolObj
    }
    
    
    // making call to controller to fetch profile data
    func fetchProfileDataFromController()
    {
        // creating object of profile data controller
        let profileDataControllervar = ProfileDataController(pProfileViewModelObj: self)
        profileDataControllervar.fetchProfileDataFromServices()
    }
    
    
    // function to send fetched profile data to view
    func sendProfileDataToView(values:ProfileDataModel)
    {
        profileValues = values
        profileViewProc?.setProfileData()
    }
    
    
    //  function to send updated data to profile controller
    func sendUpdatedProfileDataToController(profileData:ProfileDataModel)
    {
        let profileDataControllervar = ProfileDataController(pProfileViewModelObj: self)
        profileDataControllervar.sendUpdatedProfileDataToController(profileData: profileData)
    }
    
}
