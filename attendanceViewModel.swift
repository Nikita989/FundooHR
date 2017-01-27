//
//  attendanceViewModel.swift
//  Fundo

//  purpose:
//  1.fetches attendance data from attendance controller
//  2. sends attendance data to view

//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendanceViewModel: NSObject,attendanceViewModelProtocol {
    
    // creating object of attendance Controller
    let attendanceControllerObj = attendanceController()
    
    // variable of type attendance View Protocol
    var attendanceViewProc:attendanceViewProtocol?
    
    
    // making call to controller to fetch monthly attendance
    func fetchMonthlyAttendanceFromController(timeStamp:Double)
    {
        attendanceControllerObj.attendanceViewModelProc = self
        attendanceControllerObj.fetchMonthlyAttendanceFromServices(timeStamp: timeStamp)
    }
    
    
    // function to send fetched Monthly Attendance to view
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[attendanceModel])
    {
        attendanceViewProc?.calendarReload(keysArr: keysArray, valArray: valArray)
    }
    
    //  function to send updated attendance to attendance controller
    func setUpdatedAttendanceToController(attendanceData:attendancePopUpModel)
    {
        attendanceControllerObj.setUpdatedAttendanceToServices(attendanceValues: attendanceData)
    }

}
