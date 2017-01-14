//
//  attendanceController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendanceController: NSObject,attendanceControllerProtocol {
    
    let attendanceServicesObj = attendanceServices()
    var attendanceViewModelProc:attendanceViewModelProtocol?
    
    func fetchMonthlyAttendanceFromServices(timeStamp:Double)
    {
        attendanceServicesObj.attendanceControllerProc = self
        attendanceServicesObj.fetchMonthlyAttendance(timeStamp: timeStamp)
     
    }
    
    func sendMonthlyAttendanceToViewModel(keysArray:[String],valArray:[attendanceModel])
    {
        attendanceViewModelProc?.sendMonthlyAttendanceToView(keysArray: keysArray, valArray: valArray)
        
    }
    
    func setUpdatedAttendanceToServices(attendanceValues:attendancePopUpModel)
    {
        attendanceServicesObj.updateAttendnce(data: attendanceValues)
        
    }

}
