//
//  personalDataServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 03/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class personalDataServices: NSObject {
    
    var controllerProtocal:personalControllerProtocal?
    
    func fetchPersonalDataFromDatabase()
    {
        Alamofire.request("http://192.168.0.118:3000/readEmployeePersonalData?token=fghf&engineerId=427201EI").responseJSON
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
//                    let name = val["employeeName"] as! String
                    let dateOfBirth = val["dateOfBirth"] as! String
                    let employeeName = val["employeeName"] as! String
                    let fatherMobile = val["fatherMobile"] as! String
                    let fatherName = val["fatherName"] as! String
                    let mobile = val["mobile"] as! String
                    let mumbaiAddress = val["mumbaiAddress"] as! String
                    let occupation = val["occupation"] as! String
                    let permenantAddress = val["permenantAddress"] as! String
                    
                    let personalModelObj = personalDataModel(annualSalary: annualSalary,dob: dateOfBirth,email:emailId,empName: employeeName,fatherMobile: fatherMobile,fatherName: fatherName,mobile: mobile,mumbaiAddr: mumbaiAddress,occupation: occupation,permanantAddr: permenantAddress)
                    
                    
                    
                    print("********************",personalModelObj.emailIdModel)
                    self.controllerProtocal?.sendPersonalDataToViewModel(value: personalModelObj)
                    
                    break
                    
                    }
                }
                }
    
    
    func updatePersonalData(personalData:personalDataModel)
    {
        let urlString: String = "http://192.168.0.118:3000/updateEmployeePersonalData"
        let params = ["token":"1a285sdffd8do8fd","engineerId":"427201EI","annualSalary":(personalData.annualSalaryModel),"dateOfBirth": (personalData.dateOfBirthModel), "emailId" : (personalData.emailIdModel),"employeeName":(personalData.employeeNameModel),"fatherMobile":(personalData.fatherMobileModel),"fatherName":(personalData.fatherNameModel),"mobile":(personalData.mobileModel),"mumbaiAddress":(personalData.mumbaiAddressModel),"occupation":(personalData.occupationModel),"permenantAddress":(personalData.permenantAddress)]
        Alamofire.request(urlString, method: .put, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("--res/Users/bridgeit/Desktop/Xcode_8.1.zipponse--",response)
                print("result----",response.result)
                //completeFalloutData.value(forKey: "falloutNumber") as! Int
                if let JSON = response.result.value{
                    let data = JSON as! NSDictionary
                    print("--- Data----",data)
                    
                }
                
        }

        
        
    }
    
}

        
        
    

        
    


