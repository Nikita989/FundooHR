//
//  loginServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 26/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class loginServices: NSObject {
    
    var loginControllerProtocolVar:loginControllerProtocol?
    
    let mdefaults = UserDefaults.standard
    func sendEmailPasswordToServer(email:String,password:String)
    {
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        let urlString: String = "\(mUrlString)/login"
        let params = ["emailId":  (email), "password" : (password)]
        Alamofire.request(urlString, method: .post, parameters: params, encoding:JSONEncoding.default)
            .responseJSON { response in
                if let JSON = response.result.value{
                let loginData = JSON as! NSDictionary
                print("---Login Data----",loginData)
                let status = loginData.value(forKey: "status") as! Int
                print("status---",status)
                    if status == 200
                    {
                let token = loginData.value(forKey: "token") as! String
                self.mdefaults.set(token, forKey: "tokenKey")
                    }
                self.loginControllerProtocolVar?.sendLoginStatusToViewModel(status: status)
                    
               }
        }
    }

}
