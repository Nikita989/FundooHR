//
//  profileProtocols.swift
//  Fundo

//  purpose:
//  1. contrains protocols for profile view


//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

// protocol of  profile controller
protocol profileControllerProtocol {
    
    func sendProfileDatatoViewModel(value:profileDataModel)
    
}

// protocol of  profile view model
protocol profileViewModelProtocal {
    
    func sendProfileDataToView(values:profileDataModel)
    
}

// protocol of  profile view
protocol profileViewProtocal {
    
    func setProfileData()
}
