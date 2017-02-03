//
//  attendanceProtocols.swift
//  Fundo

//  purpose:
//  1. contrains protocols for attendance view


//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

// protocol of attendance ViewModel
protocol AttendanceViewModelProtocol {
    
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[AttendanceModel])
}

// protocol of attendanceController
protocol AttendanceControllerProtocol {
    
    func sendMonthlyAttendanceToViewModel(keysArray:[String],valArray:[AttendanceModel])
}

// protocol of attendance view
protocol AttendanceViewProtocol {
    
    func calendarReload(keysArr:[String],valArray:[AttendanceModel])
    
}
