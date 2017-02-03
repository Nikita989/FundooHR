//
//  hrDataViewModel.swift
//  Fundo

//  purpose:
//  1.fetches data from hr data controller
//  2. sends hr data to view

//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class HrDataViewModel: NSObject,ViewModelProtocol {
    
    // variable of type hr data model
    var mHrValues:HrDataModel?
    
    // variable of type view controller
    var mViewObj:ViewController?
    
    // variable of type hr view protocol
    var mHrViewObj:HrviewProtocal?
    
    init(mHrViewProtocolObj:HrviewProtocal) {
        
        mHrViewObj = mHrViewProtocolObj
    }
    
    // making call to controller to fetch hr data
    func fetchHrDataFromController()
    {
        // creating object of hr data controller
        let hrDataControllerVar = HrDataController(mHrViewModelProtocolObj: self)
        hrDataControllerVar.fetchHrDataFromServices()
    }
    
    // function to send fetched hr data to view
    func sendDataToView(values:HrDataModel)
    {
        mHrValues = values
        mViewObj?.sethrDataValues()
    }
    
    //  function to send updated data to hr controller
    func sendUpdatedHrDataToController(hrData:HrDataModel)
    {
        let hrDataControllerVar = HrDataController(mHrViewModelProtocolObj: self)
        hrDataControllerVar.sendUpdatedHrDataToServices(hrData: hrData)
    }
    
    
}
