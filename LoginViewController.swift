//
//  loginViewController.swift
//  Fundo

//  purpose:
//  1. lets user enter emailId and Password
//  2. validates emailId and Password
//  3. Performs segue on Sussessfull Login

//  Created by BridgeLabz Solution LLP on 05/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

var engineerId:String = "40016EI"

class loginViewController: UIViewController,loginViewProtocol {
    
    // outlet of email textfield
    @IBOutlet weak var emailField: UITextField!
    // outlet of password textfield
    @IBOutlet weak var passwordField: UITextField!
    // outlet of logoImage
    @IBOutlet weak var logo: UIImageView!
    // outlet of login Button
    @IBOutlet weak var loginButton: UIButton!
    // outlet of login view
    @IBOutlet weak var loginView: UIView!
    // outlet of login activity indicator
    @IBOutlet weak var loginActivityIndicator: UIActivityIndicatorView!
    
    var mEmail:String?                     // variable to hold email
    var mPassword:String?                  // variable to hold password
    var mOffsetCheckBOOL = false           // boolean variable for offset check
    var mloginViewModelObj:loginViewModel? // variable of type login view model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginActivityIndicator.isHidden = true
        loginView.layer.shadowColor = UIColor.black.cgColor
        logo.layer.shadowColor = UIColor.black.cgColor
        // create object of login view model
        mloginViewModelObj = loginViewModel()
        mloginViewModelObj?.loginViewProtocolVar = self
        }
    
 // action for login button and validating email id and password
    @IBAction func loginBtn(_ sender: UIButton) {
    loginActivityIndicator.isHidden = false
    loginActivityIndicator.startAnimating()
    mEmail = emailField.text
    mPassword = passwordField.text
        if mEmail == "" || mPassword == "" {
            // display alert message if entered email and password is incorrect
            let alert = UIAlertController(title: "Alert", message: "Enter Valid emailId and Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            loginActivityIndicator.isHidden = true
            loginActivityIndicator.stopAnimating()
            
        }
        else
        {
      let value = self.validateUser(enteredEmail: mEmail!, enteredPassword: mPassword!)
            if value {
                // performin api call to validate email and password
                mloginViewModelObj?.sendEmailPasswordToController(email: mEmail!, password: mPassword!)
            }
            else{
                let alert = UIAlertController(title: "Alert", message: "Enter Valid emailId and Password", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                loginActivityIndicator.isHidden = true
                loginActivityIndicator.stopAnimating()
            }
    }
    }
    
    
    // function to validate email and password using REGEX
    func validateUser(enteredEmail:String,enteredPassword:String) ->Bool
    {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
      let passwordRegex = "^([a-zA-Z0-9@*#]{8,15})$"
      let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        if emailTest.evaluate(with: enteredEmail) && passwordTest.evaluate(with: enteredPassword)
        {
         return true
        }
        else
        {
      return false
        }
        
    }
    
    
    // function to validate the login response status
    func validateResponse()
    {
        if(mloginViewModelObj?.responseStatus == 200){
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        else if(mloginViewModelObj?.responseStatus == 401){
            loginActivityIndicator.isHidden = true
            loginActivityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Alert", message: "user doesn't exist", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(mloginViewModelObj?.responseStatus == 304){
            loginActivityIndicator.isHidden = true
            loginActivityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Alert", message: "oops! Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
    }

 }


    
    


    


