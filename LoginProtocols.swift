//
//  loginProtocols.swift
//  Fundo

//  purpose:
//  1. contrains protocols for login view


//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

// protocol of login view model
protocol LoginViewModelProtocol {
    func sendLoginStatusToView(status:Int)
}

// protocol of login Controller
protocol LoginControllerProtocol {
    func sendLoginStatusToViewModel(status:Int)
}

// protocol of login view
protocol LoginViewProtocol {
    func validateResponse()
}
