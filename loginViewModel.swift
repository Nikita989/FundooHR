//
//  loginViewModel.swift
//  Fundo

// purpose:
// 1.sends user credentials to login view controller
// 2.sends login status to the view

//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class loginViewModel: NSObject,loginViewModelProtocol {
    
    // variable of type int
    var mResponseStatus:Int?
    
    // variable of type loginViewProtocol
    var mLoginViewProtocolVar:loginViewProtocol?
    
    init(loginViewProtocolObj:loginViewProtocol) {
        
        mLoginViewProtocolVar = loginViewProtocolObj
    }
    
    // function to send email id and password to login controller
    func sendEmailPasswordToController(email:String,password:String)
    {
        let mLoginControllerObj = loginController(mLoginViewModelProtocolObj: self)
        mLoginControllerObj.sendEmailPasswordToServices(email: email, password: password)
    }
    
    
    // function to send login status to view
    func sendLoginStatusToView(status:Int)
    {
        mResponseStatus = status
        print(status)
        mLoginViewProtocolVar?.validateResponse()
        
    }
    
}
