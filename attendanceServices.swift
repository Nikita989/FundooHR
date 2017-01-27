//
//  attendanceServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 10/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
class attendanceServices: NSObject {
    var fetchedToken:String?
    var i:Int?
    var temp:NSDictionary?
    var keysArray:[String] = []
    var valueArray:[attendanceModel] = []
    var num:String?
    var attendanceControllerProc:attendanceControllerProtocol?
    func fetchToken() -> String
    {
        var detailsArray : [LoginToken]?
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            let fetchReq : NSFetchRequest = LoginToken.fetchRequest()
            detailsArray = try context.fetch(fetchReq)
            self.fetchedToken = detailsArray?[0].token
            print(fetchedToken!)
            
        }catch{
            print("fetching failed")
        }
        return fetchedToken!
    }
    
    func fetchMonthlyAttendance(timeStamp:Double)
    {
        keysArray = []
        valueArray = []
        print("****timestamp is",timeStamp)
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        Alamofire.request("\(mUrlString)/readEmployeeMonthlyAttendance?token=1a285sdffd8do8fd&engineerId=\(engineerId)&timeStamp=\(timeStamp)").responseJSON
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
            let attendanceObj = attendanceModel(attendanceStatusVal: data1,markedStatusVal: data2,punchInVal: data3,punchOutVal: data4,reasonVal: data5)
                 self.valueArray.append(attendanceObj)
                }
            
           print("^^^^^^^^^^^^^^^^^",self.keysArray)
            self.attendanceControllerProc?.sendMonthlyAttendanceToViewModel(keysArray: self.keysArray, valArray: self.valueArray)
                    break
                }
        }
    }
    
    func updateAttendnce(data:attendancePopUpModel)
    {
        let mUtilityObj = utility()
        let mUrlString = mUtilityObj.fetchplistData()
        let urlString: String = "\(mUrlString)/createEmployeeDayAttendance"
        let params = ["token":"1a285sdffd8do8fd","engineerId":(engineerId),"timeStamp": (data.timeStamp),"attendanceStatus" : (data.attendanceStatus),"markedStatus":(data.markedStatus),"punchIn":(data.punchIn),"punchOut":(data.punchOut),"reason":(data.reason)]
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default)
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
