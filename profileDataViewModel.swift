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

class profileDataViewModel: NSObject,profileViewModelProtocal {
    
    // variable of type profile view protocol
    var profileViewProc:profileViewProtocal?
    
    // variable of type profile data model
    var profileValues:profileDataModel?
    
    init(mProfileViewProtocolObj:profileViewProtocal) {
        
        profileViewProc = mProfileViewProtocolObj
    }
    
    
    // making call to controller to fetch profile data
    func fetchProfileDataFromController()
    {
        // creating object of profile data controller
        let profileDataControllervar = profileDataController(pProfileViewModelObj: self)
        profileDataControllervar.fetchProfileDataFromServices()
    }
    
    
    // function to send fetched profile data to view
    func sendProfileDataToView(values:profileDataModel)
    {
        profileValues = values
        profileViewProc?.setProfileData()
    }
    
    
    //  function to send updated data to profile controller
    func sendUpdatedProfileDataToController(profileData:profileDataModel)
    {
        let profileDataControllervar = profileDataController(pProfileViewModelObj: self)
        profileDataControllervar.sendUpdatedProfileDataToController(profileData: profileData)
    }
    
}
