//
//  loginProtocols.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation


protocol loginViewModelProtocol {
    func sendLoginStatusToView(status:Int)
}

protocol loginControllerProtocol {
    func sendLoginStatusToViewModel(status:Int)
}

protocol loginViewProtocol {
    func validateResponse()
}
