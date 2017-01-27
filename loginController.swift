//
//  loginController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class loginController: NSObject,loginControllerProtocol {
    
    var loginViewModelProtocolVar:loginViewModelProtocol?
    
    func sendEmailPasswordToServices(email:String,password:String)
    {
        let loginServiceObj = loginServices()
        loginServiceObj.loginControllerProtocolVar = self
        loginServiceObj.sendEmailPasswordToServer(email: email, password: password)
    }

    
    func sendLoginStatusToViewModel(status:Int)
    {
        loginViewModelProtocolVar?.sendLoginStatusToView(status: status)
        
    }
}
