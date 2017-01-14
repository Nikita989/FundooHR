//
//  loginViewController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 05/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
class loginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    var fetchedToken:String?
    var email:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 5
        loginView.layer.cornerRadius = 10
        
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
        loginView.layer.shadowOpacity = 0.4
        loginView.layer.shadowRadius = 1.3
        
        logo.layer.shadowColor = UIColor.black.cgColor
        logo.layer.shadowOffset = CGSize(width:0,height: 2.0)
        logo.layer.shadowOpacity = 0.5
        logo.layer.shadowRadius = 2.0
        

        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginBtn(_ sender: UIButton) {
        
         email = emailField.text
         password = passwordField.text
        
        let urlString: String = "http://192.168.0.171:3000/login"
        let params = ["emailId":  (email), "password" : (password)]
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                if let JSON = response.result.value{
                    let loginData = JSON as! NSDictionary
                    print("---Login Data----",loginData)
                    let status = loginData.value(forKey: "status") as! Int
                    print("status---",status)
                    if(status == 200){
                        self.fetchedToken = loginData.value(forKey: "token") as? String
                        self.saveInCoreData(saveToken: self.fetchedToken!)
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Alert", message: "user doesn't exit", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
        }
       
        }
    
    func saveInCoreData(saveToken:String) -> Void {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let user = LoginToken(context: context)
        user.token = saveToken
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
   

    }
    


    


