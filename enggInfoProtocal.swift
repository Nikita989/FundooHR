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
protocol enggInfoViewModelProtocol {
    
    func sendDataToView(values:enggInfoModel)
    
}

// protocol of enggInfo controller
protocol enggInfoControllerProtocol {
    
    func sendDataToViewModel(value:enggInfoModel)
    
}

// protocol of enggInfo View
protocol enggInfoViewProtocol {
    
    func setEnggInfoData()
}
