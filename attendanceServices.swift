//
//  attendanceServices.swift
//  Fundo

//  Purpose:
//  1. It is a Services class of BankData View
//  2. It makes a REST call to get EmployeeBank data & UpdateEmployeeBank data
//  3. It implements  protocols to pass data from BankDataServices
//     to BankData Controller

//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
class attendanceServices: NSObject {
    
    // variable to store token
    var fetchedToken:String?
    
    // variable of type integer
    var i:Int?
    
    // variable of type nsdictionary
    var temp:NSDictionary?
    
    //  variable to store array of strings
    var keysArray:[String] = []
    
    //  variable to store array of attendanceModel
    var valueArray:[attendanceModel] = []
    
    //  variable to store string
    var num:String?
    
    //  variable of type attendanceControllerProtocol
    var attendanceControllerProc:attendanceControllerProtocol?
    
    // constructor of attendanceServices
    init(pAttendanceControllerProtocolObj:attendanceControllerProtocol) {
        
        attendanceControllerProc = pAttendanceControllerProtocolObj
    }
    
    
    // making rest call to fetch attendance data
    func fetchMonthlyAttendance(timeStamp:Double)
    {
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        keysArray = []
        valueArray = []
        print("****timestamp is",timeStamp)
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        
        //Making a REST call

        Alamofire.request("\(mUrlString)/readEmployeeMonthlyAttendance?engineerId=\(engineerId)&timeStamp=\(timeStamp)",headers:header).responseJSON
            {
                response in
                switch response.result
                {
                case .failure(let error):
                    print("**************error****************")
                    break
                case .success(let json):
                    print("Success: \(response.response?.url)")
                    let jsonData = json as! NSDictionary
                    let val = jsonData["attendanceData"] as! NSDictionary
                    print("&&&&&&&&&&&&&&&&&&&&&",val)
                    let keys = val.allKeys
                    if keys.count == 0
                    {
                        self.keysArray = []
                        self.valueArray = []
                    }
                    for num in keys {
                        let data = val[num] as! NSDictionary
                        print(num)
                        print(self.keysArray)
                        self.keysArray.append(num as! String)
                        print(self.keysArray)
                        let data1 = data["attendanceStatus"] as! String
                        let data2 = data["markedStatus"] as! String
                        let data3 = data["punchIn"] as! String
                        let data4 = data["punchOut"] as! String
                        let data5 = data["reason"] as! String
                        
                        //Initialise attendanceDataModel
                        let attendanceObj = attendanceModel(attendanceStatusVal: data1,markedStatusVal: data2,punchInVal: data3,punchOutVal: data4,reasonVal: data5)
                        self.valueArray.append(attendanceObj)
                    }
                    
                    print("^^^^^^^^^^^^^^^^^",self.keysArray)
                    self.attendanceControllerProc?.sendMonthlyAttendanceToViewModel(keysArray: self.keysArray, valArray: self.valueArray)
                    break
                }
        }
    }
    
    
    //Method making a REST call to update attendance data in server
    func updateAttendnce(data:attendancePopUpModel)
    {
        let mUtilityObj = utility()
        let mUrl = mUtilityObj.fetchplistData()
        let fetchedToken = UserDefaults.standard.value(forKey: "tokenKey")
        let header: HTTPHeaders = [
            "x-token":fetchedToken as! String
        ]
        let mUrl2 = URL(string: "\(mUrl)/createEmployeeDayAttendance")
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"timeStamp": (data.timeStamp),"attendanceStatus" : (data.attendanceStatus),"markedStatus":(data.markedStatus),"punchIn":(data.punchIn),"punchOut":(data.punchOut),"reason":(data.reason)]
        
        //Making a REST call
        Alamofire.request(mUrl2!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
        
    }
}
