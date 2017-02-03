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

class AttendanceViewModel: NSObject,AttendanceViewModelProtocol {
    
    // variable of type attendance View Protocol
    var mAttendanceViewProc:AttendanceViewProtocol?
    
    init(attendanceViewProtocolObj:AttendanceViewProtocol) {
        
        mAttendanceViewProc = attendanceViewProtocolObj
    }
    
    // making call to controller to fetch monthly attendance
    func fetchMonthlyAttendanceFromController(timeStamp:Double)
    {
        // creating object of attendance Controller
        let mAttendanceControllerObj = AttendanceController(mAttendanceViewModelProtocolObj: self)
        mAttendanceControllerObj.fetchMonthlyAttendanceFromServices(timeStamp: timeStamp)
    }
    
    
    // function to send fetched Monthly Attendance to view
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[AttendanceModel])
    {
        mAttendanceViewProc?.calendarReload(keysArr: keysArray, valArray: valArray)
    }
    
    
    //  function to send updated attendance to attendance controller
    func setUpdatedAttendanceToController(attendanceData:AttendancePopUpModel)
    {
        // creating object of attendance Controller
        let attendanceControllerObj = AttendanceController(mAttendanceViewModelProtocolObj: self)
        attendanceControllerObj.setUpdatedAttendanceToServices(attendanceValues: attendanceData)
    }
    
}
