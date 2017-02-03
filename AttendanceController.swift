//
//  attendanceController.swift

//  Fundo
//  1.fetches data from attendance services
//  2. sends attendance data to view model

//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class AttendanceController: NSObject,AttendanceControllerProtocol {
    
    // variable of type attendanceViewModelProtocol
    var attendanceViewModelProc:AttendanceViewModelProtocol?
    
    // constructor of attendanceController
    init(mAttendanceViewModelProtocolObj:AttendanceViewModelProtocol) {
        
        attendanceViewModelProc = mAttendanceViewModelProtocolObj
    }
    
    // making call to services to fetch attendance data
    func fetchMonthlyAttendanceFromServices(timeStamp:Double)
    {
        let attendanceServicesObj = AttendanceServices(pAttendanceControllerProtocolObj:self)
        attendanceServicesObj.fetchMonthlyAttendance(timeStamp: timeStamp)
    }
    
    // send attendance data to view model
    func sendMonthlyAttendanceToViewModel(keysArray:[String],valArray:[AttendanceModel])
    {
        attendanceViewModelProc?.sendMonthlyAttendanceToView(keysArray: keysArray, valArray: valArray)
    }
    
    
    // send updated attendance to services
    func setUpdatedAttendanceToServices(attendanceValues:AttendancePopUpModel)
    {
        let attendanceServicesObj = AttendanceServices(pAttendanceControllerProtocolObj:self)
        attendanceServicesObj.updateAttendnce(data: attendanceValues)
        
    }
    
}
