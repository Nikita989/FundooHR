//
//  enggInfoServices.swift
//  Fundo

//  Purpose:
//  1. It is a Services class of Engineer info View
//  2. It makes a REST call to get Engineer data
//  3. It implements  protocols to pass data from Engineer info Services
//     to engineer info Controller

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class enggInfoServices: NSObject {
    
    // varible of type enggInfoControllerProtocol
    var enggControllerProtocol:enggInfoControllerProtocol?
    
    // constructor of enggInfoServices
    init(pEnggControllerProtocolObj:enggInfoControllerProtocol) {
        
        enggControllerProtocol = pEnggControllerProtocolObj
    }
    
    // making restcall to fetch engineer info
    func fetchDataFromDataBase()
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        Alamofire.request("\(mUrlString)/readEmployeeTrackingData?engineerId=\(engineerId)",headers:header).responseJSON
            { response in
                print("value----",response.result.value)
                switch response.result
                {
                case .failure(let error):
                    print("**************error****************")
                    break
                case .success(let json):
                    print("Success: \(response.response?.url)")
                    let jsonData = json as! NSDictionary
                    let val = jsonData["employeeData"] as! NSDictionary
                    let employeeName = val["employeeName"] as! String
                    let employeeStatus = val["employeeStatus"] as! String
                    let company = val["company"] as! String
                    let mobile = val["mobile"] as! String
                    let emailId = val["emailId"] as! String
                    let blStartDate = val["blStartDate"] as! String
                    let companyJoinDate = val["companyJoinDate"] as! String
                    let companyLeaveDate = val["companyLeaveDate"] as! String
                    let leaveTaken = val["leaveTaken"] as! Int
                    let employeeImage = val["imageUrl"] as! String
                    //Initialised Engineer InfoModel
                    let enggInfoObj = enggInfoModel(employeeName: employeeName,employeeStatus: employeeStatus,cmp: company,empMobile: mobile,empEmail: emailId,empStartDate: blStartDate,joinDate: companyJoinDate,leaveDate: companyLeaveDate,leaves: leaveTaken,employeeImage: employeeImage)
                    self.enggControllerProtocol?.sendDataToViewModel(value: enggInfoObj)
                }
          }
    }
}









