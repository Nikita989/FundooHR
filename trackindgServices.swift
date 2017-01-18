//
//  trackindgServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class trackingServices: NSObject {

    var trackingControllerProtocal:trackingControllerProtocol?
    func fetchDataFromDataBase()
    {
        
        Alamofire.request("http://192.168.0.118:3000/readEmployeeTrackingData?token=fghf&engineerId=427201EI").responseJSON
            {
                response in
                print("value----",response.result.value!)
                
                switch response.result
                {
                    
                case .failure(let error):
                    
                    print("**************error****************")
                    
                    break
                    
                case .success(let json):
                    
                    print("Success: \(response.response?.url)")
                    
                    
                    let jsonData = json as! NSDictionary
                    

//                    print(jsonData)
                   
                    let val = jsonData["trackingData"] as! NSDictionary
                    
                    let bridgelabzEndDate = val["bridgelabzEndDate"] as! String
                    let bridgelabzStartDate = val["bridgelabzStartDate"] as! String
                    let currentWeek = val["currentWeek"] as! String
                    let numberOfWeeksLeft = val["numberOfWeeksLeft"] as! String
                    let techStack = val["techStack"] as! String
                    let week1 = val["week1"] as! String

                
                    let trackingModelObj = trackingDataModel(blEndDate: bridgelabzEndDate,blStartDate: bridgelabzStartDate,curWeek: currentWeek,numOfWeeks: numberOfWeeksLeft,stack: techStack,week1: week1)
                        
                    self.trackingControllerProtocal?.sendDataToViewModel(value: trackingModelObj)
                    
                    break
                    
                    }
                }
        }
        

    func updateTrackingData(trackingData:trackingDataModel)
    {
        let urlString: String = "http://192.168.0.118:3000/updateEmployeeTrackingData"
        let params = ["token":"1a285sdffd8do8fd","engineerId":"427201EI","bridgelabzEndDate": (trackingData.endDate), "bridgelabzStartDate" : (trackingData.startDate),"currentWeek":(trackingData.currentWeek),"numberOfWeeksLeft":(trackingData.noOfWeeksLeft),"techStack":(trackingData.techStack),"week1":(trackingData.week)]
        Alamofire.request(urlString, method: .put, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("--response--",response)
                print("result----",response.result)
                //completeFalloutData.value(forKey: "falloutNumber") as! Int
                if let JSON = response.result.value{
                    let data = JSON as! NSDictionary
                    print("--- Data----",data)
                    
                }
                
        }
        

        
    }
        
    }
    

        
    
    

