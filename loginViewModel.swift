//
//  loginViewModel.swift
//  Fundo

// purpose:


//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class loginViewModel: NSObject,loginViewModelProtocol {
    
    var responseStatus:Int?
    var loginViewProtocolVar:loginViewProtocol?
    func sendEmailPasswordToController(email:String,password:String)
    {
        let loginControllerObj = loginController()
        loginControllerObj.loginViewModelProtocolVar = self
        loginControllerObj.sendEmailPasswordToServices(email: email, password: password)
        
    }

    func sendLoginStatusToView(status:Int)
    {
        responseStatus = status
        print(status)
        loginViewProtocolVar?.validateResponse()
        
        
        
    }
    
}
