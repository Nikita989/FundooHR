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
protocol attendanceViewModelProtocol {
    
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[attendanceModel])
}

// protocol of attendanceController
protocol attendanceControllerProtocol {
    
    func sendMonthlyAttendanceToViewModel(keysArray:[String],valArray:[attendanceModel])
}

// protocol of attendance view
protocol attendanceViewProtocol {
    
    func calendarReload(keysArr:[String],valArray:[attendanceModel])
    
}
