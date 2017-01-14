//
//  enggInfoProtocal.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

protocol enggInfoViewModelProtocol {
    
    func sendDataToView(values:enggInfoModel)

}

protocol enggInfoControllerProtocol {
    
    func sendDataToViewModel(value:enggInfoModel)

    
}

protocol enggInfoViewProtocol {
    
    func setEnggInfoData()
}
