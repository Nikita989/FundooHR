//
//  trackindgServices.swift
//  Fundo
//
//  Purpose:
//  1. It is a Services class of TrackingData View
//  2. It makes a REST call to get EmployeeTracking data & UpdateEmployeeTracking data
//  3. It implements  protocols to pass data from TrackingServices
//     to Tracking Controller

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class trackingServices: NSObject {
    
    //Var of type trackingControllerProtocol
    var trackingControllerProtocal:trackingControllerProtocol?
    
    init(pTrackingControllerProtocolObj:trackingControllerProtocol) {
        
        trackingControllerProtocal = pTrackingControllerProtocolObj
    }
    
    //Method making a REST call to get Employee Tracking data from server
    func fetchDataFromDataBase()
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        
        //Making a REST call
        Alamofire.request("\(mUrlString)/readEmployeeTrackingData?engineerId=\(engineerId)",headers:header).responseJSON
            {
                response in
                print("value----",response.result.value!)
                switch response.result
                {
                case .failure(let error):
                    print("*************error****************")
                    break
                case .success(let json):
                    print("Success: \(response.response?.url)")
                    let jsonData = json as! NSDictionary
                    let val = jsonData["trackingData"] as! NSDictionary
                    let bridgelabzEndDate = val["bridgelabzEndDate"] as! String
                    let bridgelabzStartDate = val["bridgelabzStartDate"] as! String
                    let currentWeek = val["currentWeek"] as! String
                    let numberOfWeeksLeft = val["numberOfWeeksLeft"] as! String
                    let techStack = val["techStack"] as! String
                    let week1 = val["week1"] as! String
                    
                    //Initialised TrackingDataModel
                    let trackingModelObj = trackingDataModel(blEndDate: bridgelabzEndDate,blStartDate: bridgelabzStartDate,curWeek: currentWeek,numOfWeeks: numberOfWeeksLeft,stack: techStack,week1: week1)
                    self.trackingControllerProtocal?.sendDataToViewModel(value: trackingModelObj)
                    break
                }
        }
    }
    
    //Method making a REST call to update Employee Tracking data in server
    func updateTrackingData(trackingData:trackingDataModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUrl2 = URL(string: "\(mUrl)/updateEmployeeTrackingData")
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"bridgelabzEndDate": (trackingData.endDate), "bridgelabzStartDate" : (trackingData.startDate),"currentWeek":(trackingData.currentWeek),"numberOfWeeksLeft":(trackingData.noOfWeeksLeft),"techStack":(trackingData.techStack),"week1":(trackingData.week)]
        Alamofire.request(mUrl2!, method: .put, parameters: params, encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
    }
    
}






