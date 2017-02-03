//
//  personalDataServices.swift
//  Fundo
//
//  Purpose:
//  1. It is a Services class of PersonalData View
//  2. It makes a REST call to get EmployeePersonal data & UpdateEmployeePersonal data
//  3. It implements  protocols to pass data from PersonalDataServices
//     to PersonalData Controller

//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class PersonalDataServices: NSObject {
    
    //Var of type PersonalControllerProtocol
    var controllerProtocal:PersonalControllerProtocal?
    
    init(mPersonalProtocolObj:PersonalControllerProtocal) {
        
        controllerProtocal = mPersonalProtocolObj
    }
    
    //Method making a REST call to get EmployeePersonal Data
    func fetchPersonalDataFromDatabase()
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        
        //Making a REST call
        Alamofire.request("\(mUrlString)/readEmployeePersonalData?engineerId=\(engineerId)",headers:header).responseJSON
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
                    let val = jsonData["personalData"] as! NSDictionary
                    let annualSalary = val["annualSalary"] as! String
                    let emailId = val["emailId"] as! String
                    let dateOfBirth = val["dateOfBirth"] as! String
                    let employeeName = val["employeeName"] as! String
                    let fatherMobile = val["fatherMobile"] as! String
                    let fatherName = val["fatherName"] as! String
                    let mobile = val["mobile"] as! String
                    let mumbaiAddress = val["mumbaiAddress"] as! String
                    let occupation = val["occupation"] as! String
                    let permenantAddress = val["permenantAddress"] as! String
                    
                    //Initialised personalDataModel Object
                    let personalModelObj = PersonalDataModel(annualSalary: annualSalary,dob: dateOfBirth,email:emailId,empName: employeeName,fatherMobile: fatherMobile,fatherName: fatherName,mobile: mobile,mumbaiAddr: mumbaiAddress,occupation: occupation,permanantAddr: permenantAddress)
                    self.controllerProtocal?.sendPersonalDataToViewModel(value: personalModelObj)
                    break
                }
        }
    }
    
    //Method making a REST call to update EmployeePersonalData
    func updatePersonalData(personalData:PersonalDataModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        
        let mUrl2 = URL(string: "\(mUrl)/updateEmployeePersonalData")
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"annualSalary":(personalData.mAnnualSalaryModel),"dateOfBirth": (personalData.mDateOfBirthModel), "emailId" : (personalData.mEmailIdModel),"employeeName":(personalData.mEmployeeNameModel),"fatherMobile":(personalData.mFatherMobileModel),"fatherName":(personalData.mFatherNameModel),"mobile":(personalData.mMobileModel),"mumbaiAddress":(personalData.mMumbaiAddressModel),"occupation":(personalData.mOccupationModel),"permenantAddress":(personalData.mPermenantAddress)]
        
        //Making REST call
        Alamofire.request(mUrl2!, method: .put, parameters: params, encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
    }
    
}









