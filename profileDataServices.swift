//
//  profileDataServices.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
class profileDataServices: NSObject {

    var controllerProtocol:profileControllerProtocol?
    func fetchProfileDataFromDataBase()
    {
        Alamofire.request("http://192.168.0.118:3000/readEmployeeProfileData?token=fghf&engineerId=427201EI").responseJSON
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
                    
                    
                                     let profileModelObj = profileDataModel(diplomaVar: diploma,degreeVar: degree,disciplineVar: discipline,yop: yearOfPassing,aggregateVar: aggregateIn,finalyearPercentagevar: finalYearPercentage,trainingInstVar: trainingInstitute,trainingDurationVar: trainingPeriod,trainingVar: training)
                                            
                                          self.controllerProtocol?.sendProfileDatatoViewModel(value: profileModelObj)
                    
                    break
                                        
                    }
                    
                }
        }

    
    func updateProfileData(profilData:profileDataModel)
    {
        let urlString: String = "http://192.168.0.118:3000/updateEmployeeProfileData"
        let params = ["token":"1a285sdffd8do8fd","engineerId":"427201EI","aggregateIn": (profilData.aggregate), "degree" : (profilData.degree),"diploma":(profilData.diploma),"discipline":(profilData.discipline),"finalYearPercentage":(profilData.finalYearPercentage),"training":(profilData.training),"trainingInstitute":(profilData.trainingInstitute),"trainingPeriod":(profilData.trainingDuration),"yearOfPassing":(profilData.yearOfPassing)]
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
    
    
    

        
    

