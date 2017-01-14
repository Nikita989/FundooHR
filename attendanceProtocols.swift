//
//  attendanceProtocols.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

protocol attendanceViewModelProtocol {
    
    func sendMonthlyAttendanceToView(keysArray:[String],valArray:[attendanceModel])
}
protocol attendanceControllerProtocol {
    
    func sendMonthlyAttendanceToViewModel(keysArray:[String],valArray:[attendanceModel])
}
protocol attendanceViewProtocol {
    
    func calendarReload(keysArr:[String],valArray:[attendanceModel])

}
