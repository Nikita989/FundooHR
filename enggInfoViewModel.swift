//
//  enggInfoViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from Engineer info controller
//  2. sends engineer info to view

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class enggInfoViewModel: NSObject,enggInfoViewModelProtocol {
    
    // variable of type enggInfo View Protocol
    var mEnggViewProc:enggInfoViewProtocol?
    
    // variable of type enggInfo model
    var mEnggInfoValues:enggInfoModel?
    
    
    init(enggInfoViewProtocolObj:enggInfoViewProtocol) {
        
        mEnggViewProc = enggInfoViewProtocolObj
    }
    
    
    // making call to controller to fetch enggInfo
    func fetchDataFromController()
    {
        let mEnggInfoControllerObj = enggInfoController(pEnggInfoViewModelProtocolObj: self)
        mEnggInfoControllerObj.fetchDataFromServices()
        
    }
    
    
    // function to send fetched engineer info to view
    func sendDataToView(values:enggInfoModel)
    {
        mEnggInfoValues = values
        mEnggViewProc?.setEnggInfoData()
    }
    
}
