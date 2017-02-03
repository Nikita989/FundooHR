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
protocol ProfileControllerProtocol {
    
    func sendProfileDatatoViewModel(value:ProfileDataModel)
    
}

// protocol of  profile view model
protocol ProfileViewModelProtocal {
    
    func sendProfileDataToView(values:ProfileDataModel)
    
}

// protocol of  profile view
protocol ProfileViewProtocal {
    
    func setProfileData()
}
