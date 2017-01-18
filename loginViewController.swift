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
    var offsetCheckBOOL = false
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
        //adding observer for notification when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //adding observer for notification when keyboard disappears
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        print("view.frame.origin.y",view.frame.origin.y)
        }
    

    @IBAction func loginBtn(_ sender: UIButton) {
        
    email = emailField.text
    password = passwordField.text
    let urlString: String = "http://192.168.0.118:3000/login"
    let params = ["emailId":  (email), "password" : (password)]
    Alamofire.request(urlString, method: .post, parameters: params, encoding:JSONEncoding.default)
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
      else if(status == 401){
        let alert = UIAlertController(title: "Alert", message: "user doesn't exist", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
      else if(status == 304){
        let alert = UIAlertController(title: "Alert", message: "oops! Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
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
   
    //Keyboard popup and Hide Notifications
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            let kbHeight = keyboardSize.size.height;
            print("kbHeight",kbHeight)
            print("email.frame.origin.y",emailField.frame.origin.y)
            print("email.frame.size.height",emailField.frame.size.height)
            print("self.view.frame.origin.y",self.view.frame.origin.y)
            
            print("password",passwordField.frame.origin.y)
            print("password",passwordField.frame.size.height)
            print("self.view.frame.origin.y",self.view.frame.origin.y)
            
            if (emailField.frame.origin.y+emailField.frame.size.height+self.view.frame.origin.y > kbHeight )
            {
                if(offsetCheckBOOL == false)
                {
                    offsetCheckBOOL = true
                    print(self.view.frame.origin.y);
                    self.view.frame.origin.y -= 80
                    print(self.view.frame.origin.y);
                }
                else
                {
                    self.view.frame.origin.y += 80
                    offsetCheckBOOL = false
                    keyboardWillShow(notification: notification)
                }
            }
            else if(passwordField.frame.origin.y+passwordField.frame.size.height+self.view.frame.origin.y < kbHeight )
            {
                //if(offsetCheckBOOL == true)
                if(offsetCheckBOOL == false)
                {
                    //offsetCheckBOOL = false
                    offsetCheckBOOL = true
                    print(self.view.frame.origin.y);
                    self.view.frame.origin.y -= 80
                    print(self.view.frame.origin.y);
                }
                else
                {
                    self.view.frame.origin.y += 80
                    //offsetCheckBOOL = true
                    offsetCheckBOOL = false
                    keyboardWillShow(notification: notification)
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if(offsetCheckBOOL == true)
            {
                offsetCheckBOOL = false
                self.view.frame.origin.y = 0
            }
        }
    }
    
}


    
    


    


