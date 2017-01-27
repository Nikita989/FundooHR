//
//  enggInfoServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class enggInfoServices: NSObject {

    var enggControllerProtocol:enggInfoControllerProtocol?
    
    func fetchDataFromDataBase()
    {
     let mUtilityObj = utility()
     let mUrlString = mUtilityObj.fetchplistData()
     Alamofire.request("\(mUrlString)/readEmployeeTrackingData?token=fghf&engineerId=\(engineerId)").responseJSON
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
      let enggInfoObj = enggInfoModel(employeeName: employeeName,employeeStatus: employeeStatus,cmp: company,empMobile: mobile,empEmail: emailId,empStartDate: blStartDate,joinDate: companyJoinDate,leaveDate: companyLeaveDate,leaves: leaveTaken)
      self.enggControllerProtocol?.sendDataToViewModel(value: enggInfoObj)
             }
          }
    }
}


        
        
        
        
        
        
 
