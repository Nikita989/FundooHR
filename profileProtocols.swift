//
//  profileProtocols.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

protocol profileControllerProtocol {
    
    func sendProfileDatatoViewModel(value:profileDataModel)

}

protocol profileViewModelProtocal {
    
    func sendProfileDataToView(values:profileDataModel)

}

protocol profileViewProtocal {
    
    func setProfileData()
}
