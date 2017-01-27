//
//  bankDataServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class bankDataServices: NSObject {

    var bankControllerProtocol:bankControllerProtocol?
    
    func fetchDataFromDataBase()
    {
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        Alamofire.request("\(mUrlString)/readEmployeeBankData?token=fghf&engineerId=\(engineerId)").responseJSON
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
        let bankModelObj = bankDataModel(accountNum: accountNumber,bankNAme: bankName,ifscCode: ifscCode,pan: pan,paySalary: paySalary,reasonVar: reason)
                    self.bankControllerProtocol?.sendDataToViewModel(value: bankModelObj)
                    break
                }
            }
        }

    
    func updateBankData(bankData:bankDataModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let urlString: String = "\(mUrl)/updateEmployeeBankData"
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"accountNumber": (bankData.accNumber), "bankName" : (bankData.bankName),"ifscCode":(bankData.bankIfscCode),"pan":(bankData.bankPan),"paySalary":(bankData.BankPaySalary),"reason":(bankData.reason)]
        Alamofire.request(urlString, method: .put, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("--response--",response)
                print("result----",response.result)
                if let JSON = response.result.value{
                    let data = JSON as! NSDictionary
                    print("--- Data----",data)
                }
           }
    }


}


