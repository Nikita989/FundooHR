//
//  profileDataServices.swift
//  Fundo
//
//  Purpose:
//  1. It is a Services class of ProfileData View
//  2. It makes a REST call to get EmployeeProfile data & UpdateEmployeeProfile data
//  3. It implements  protocols to pass data from ProfileDataServices
//     to ProfileData Controller

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class profileDataServices: NSObject {
    
    //var of type profileControllerProtocol
    var controllerProtocol:profileControllerProtocol?
    
    init(pProfileControllerProtocolObj:profileControllerProtocol) {
        
        controllerProtocol = pProfileControllerProtocolObj
        
    }
    //Method making a REST call to get Employee Profile data from server
    func fetchProfileDataFromDataBase()
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        
        //Making a REST call
        Alamofire.request("\(mUrlString)/readEmployeeProfileData?engineerId=\(engineerId)",headers:header).responseJSON
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
                    print(jsonData)
                    let val = jsonData["profileData"] as! NSDictionary
                    let diploma = val["diploma"] as! String
                    let degree = val["degree"] as! String
                    let discipline = val["discipline"] as! String
                    let yearOfPassing = val["yearOfPassing"] as! String
                    let aggregateIn = val["aggregateIn"] as! String
                    let finalYearPercentage = val["finalYearPercentage"] as! String
                    let trainingInstitute = val["trainingInstitute"] as! String
                    let trainingPeriod = val["trainingPeriod"] as! String
                    let training = val["training"] as! String
                    
                    //Initialised profileDataModel
                    let profileModelObj = profileDataModel(diplomaVar: diploma,degreeVar: degree,disciplineVar: discipline,yop: yearOfPassing,aggregateVar: aggregateIn,finalyearPercentagevar: finalYearPercentage,trainingInstVar: trainingInstitute,trainingDurationVar: trainingPeriod,trainingVar: training)
                    self.controllerProtocol?.sendProfileDatatoViewModel(value: profileModelObj)
                    break
                }
                
        }
    }
    
    //Method making a REST call to update employee Profile data in server
    func updateProfileData(profilData:profileDataModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUrl2 = URL(string: "\(mUrl)/updateEmployeeProfileData")
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"aggregateIn": (profilData.aggregate), "degree" : (profilData.degree),"diploma":(profilData.diploma),"discipline":(profilData.discipline),"finalYearPercentage":(profilData.finalYearPercentage),"training":(profilData.training),"trainingInstitute":(profilData.trainingInstitute),"trainingPeriod":(profilData.trainingDuration),"yearOfPassing":(profilData.yearOfPassing)]
        
        //Making a REST call
        Alamofire.request(mUrl2!, method: .put, parameters: params, encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
        
        
    }
    
}







