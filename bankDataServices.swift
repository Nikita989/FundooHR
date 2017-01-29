//
//  bankDataServices.swift
//  Fundo
//
//  Purpose:
//  1. It is a Services class of BankData View
//  2. It makes a REST call to get EmployeeBank data & UpdateEmployeeBank data
//  3. It implements  protocols to pass data from BankDataServices
//     to BankData Controller

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class bankDataServices: NSObject {
    
    //Var of type bankControllerProtocol
    var bankControllerProtocol:bankControllerProtocol?
    
    init(pBankControllerProtocolObj:bankControllerProtocol) {
        
        bankControllerProtocol = pBankControllerProtocolObj
    }
    
    //Method making a REST call to get Employee Bank data from server
    func fetchDataFromDataBase()
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        
        //Making a REST call
        Alamofire.request("\(mUrlString)/readEmployeeBankData?engineerId=\(engineerId)",headers:header).responseJSON
            {
                response in
                print("value----",response.result.value)
                switch response.result
                {
                case .failure(let error):
                    print("**************error****************")
                    break
                case .success(let json):
                    print("Success: \(response.response?.url)")
                    let jsonData = json as! NSDictionary
                    let val = jsonData["bankData"] as! NSDictionary
                    let accountNumber = val["accountNumber"] as! String
                    let bankName = val["bankName"] as! String
                    let ifscCode = val["ifscCode"] as! String
                    let pan = val["pan"] as! String
                    let paySalary = val["paySalary"] as! String
                    let reason = val["reason"] as! String
                    
                    //Initialised BankDataModel
                    let bankModelObj = bankDataModel(accountNum: accountNumber,bankNAme: bankName,ifscCode: ifscCode,pan: pan,paySalary: paySalary,reasonVar: reason)
                    self.bankControllerProtocol?.sendDataToViewModel(value: bankModelObj)
                    break
                }
        }
    }
    
    
    //Method making a REST call to update Employee Bank data in server
    func updateBankData(bankData:bankDataModel)
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let mUrl2 = URL(string: "\(mUrl)/updateEmployeeBankData")
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"accountNumber": (bankData.accNumber), "bankName" : (bankData.bankName),"ifscCode":(bankData.bankIfscCode),"pan":(bankData.bankPan),"paySalary":(bankData.BankPaySalary),"reason":(bankData.reason)]
        
        //Making a REST call
        Alamofire.request(mUrl2!, method: .put, parameters: params, encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
    }
    
    
}


