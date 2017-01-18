//
//  attendanceViewModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendanceViewModel: NSObject,attendanceViewModelProtocol {
    
    let attendanceControllerObj = attendanceController()
    var attendanceViewProc:attendanceViewProtocol?
    
    func fetchMonthlyAttendanceFromController(timeStamp:Double)
    {
        attendanceControllerObj.attendanceViewModelProc = self
        attendanceControllerObj.fetchMonthlyAttendanceFromServices(timeStamp: timeStamp)
    }
    
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[attendanceModel])
    {
        print(keysArray)
        print(valArray)
        attendanceViewProc?.calendarReload(keysArr: keysArray, valArray: valArray)
    }
    
    func setUpdatedAttendanceToController(attendanceData:attendancePopUpModel)
    {
        attendanceControllerObj.setUpdatedAttendanceToServices(attendanceValues: attendanceData)
        
    }

}
