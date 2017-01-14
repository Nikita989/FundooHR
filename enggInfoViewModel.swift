//
//  enggInfoViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoViewModel: NSObject,enggInfoViewModelProtocol {

    var enggViewProc:enggInfoViewProtocol?
    var enggInfoValues:enggInfoModel?
    
    func fetchDataFromController()
    {
        let enggInfoControllerObj = enggInfoController()
        enggInfoControllerObj.enggViewModelProtocol = self
        enggInfoControllerObj.fetchDataFromServices()
        
    }
    
    func sendDataToView(values:enggInfoModel)
    {
        enggInfoValues = values
        enggViewProc?.setEnggInfoData()
        
    }
    
    func sendUpdatedEnggInfoDataToController(EnggInfo:enggInfoModel)
    {
        
        
    }
    
}
