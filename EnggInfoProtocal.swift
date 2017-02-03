//
//  enggInfoProtocal.swift
//  Fundo

//  purpose:
//  1. contrains protocols for engineer info view


//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

// protocol of enggInfoViewModel
protocol EnggInfoViewModelProtocol {
    
    func sendDataToView(values:EnggInfoModel)
    
}

// protocol of enggInfo controller
protocol EnggInfoControllerProtocol {
    
    func sendDataToViewModel(value:EnggInfoModel)
    
}

// protocol of enggInfo View
protocol EnggInfoViewProtocol {
    
    func setEnggInfoData()
}
