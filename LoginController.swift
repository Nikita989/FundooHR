//
//  loginController.swift

//  Fundo
//  1.fetches login status from login controller
//  2. sends login resoponse to the view model

//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class LoginController: NSObject,LoginControllerProtocol {
    
    // variable of type loginViewModelProtocol
    var loginViewModelProtocolVar:LoginViewModelProtocol?
    
    // constructor of loginController
    init(mLoginViewModelProtocolObj:LoginViewModelProtocol) {
        
        loginViewModelProtocolVar = mLoginViewModelProtocolObj
    }
    
    // making call to services to validate user
    func sendEmailPasswordToServices(email:String,password:String)
    {
        let loginServiceObj = LoginServices(pLoginControllerProtocolObj: self)
        loginServiceObj.sendEmailPasswordToServer(email: email, password: password)
    }
    
    
    // send login response to view
    func sendLoginStatusToViewModel(status:Int)
    {
        loginViewModelProtocolVar?.sendLoginStatusToView(status: status)
        
    }
}
