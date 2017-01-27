//
//  hrDataServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 02/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class hrDataServices: NSObject {

    var hrDataModelVar:hrDataModel?
    var hrDataContProtocal:controllerProtocal?
    func fetchHrDataFromDatabase()
    {
      let mUtilityObj = utility()
      let mUrlString = mUtilityObj.fetchplistData()
      Alamofire.request("\(mUrlString)/readEmployeeHRData?token=fghf&engineerId=\(engineerId)").responseJSON
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
      if jsonData["hrData"] != nil
      {
      let dummy = jsonData["hrData"] as! NSDictionary
      let startDate = dummy["blStartDate"] as! String
      let contractInitiated = dummy["compContractInitiated"] as! String
      let contractSigned = dummy["compContractSigned"] as! String
      let company = dummy["company"] as! String
      let companyJoinDate = dummy["companyJoinDate"] as! String
      let companyLeaveDate = dummy["companyLeaveDate"] as! String
      let contractSignDate = dummy["contractSignDate"] as! String
      let employeeStatus = dummy["employeeStatus"] as! String
      let enggContractInitiated = dummy["enggContractInitiated"] as!String
      let enggContractSigned = dummy["enggContractSigned"] as! String
      let fellowshipPeriod = dummy["fellowshipPeriod"] as! String
      let hiringCity = dummy["hiringCity"] as! String
      let initiateTransfer = dummy["initiateTransfer"] as! String
      let hrModelObj = hrDataModel(startDate:startDate,contractInitiated:contractInitiated,contractSigned:contractSigned,company:company,companyJoinDate:companyJoinDate,companyLeaveDate:companyLeaveDate,contractSignDate:contractSignDate,employeeStatus:employeeStatus,enggContractInitiated:enggContractInitiated,enggContractSigned:enggContractSigned,fellowshipPeriod:fellowshipPeriod,hiringCity:hiringCity,initiateTransfer:initiateTransfer)
      self.hrDataModelVar = hrModelObj
      self.hrDataContProtocal?.sendDataToViewModel(values:self.hrDataModelVar!)
                    }
      break
                }
            }
        }
    
    
    func updateHrData(hrData:hrDataModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let urlString: String = "\(mUrl)/updateEmployeeHRData"
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"blStartDate": (hrData.startDateModel), "compContractInitiated" : (hrData.contractInitiatedModel),"compContractSigned":(hrData.contractSignedModel),"company":hrData.companyModel,"companyJoinDate":(hrData.companyJoinDateModel),"companyLeaveDate":(hrData.companyLeaveDateModel),"contractSignDate":(hrData.contractSignDateModel),"employeeStatus":hrData.employeeStatusModel,"enggContractInitiated":(hrData.enggContractInitiatedModel),"enggContractSigned":(hrData.enggContractSignedModel),"fellowshipPeriod":(hrData.fellowshipPeriodModel),"hiringCity":(hrData.hiringCityModel),"initiateTransfer":hrData.initiateTransferModel]
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
       

