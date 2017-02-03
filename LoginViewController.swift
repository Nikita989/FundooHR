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

class LoginViewController: UIViewController,LoginViewProtocol {
    
    // outlet of email textfield
    @IBOutlet weak var mEmailField: UITextField!
    
    // outlet of password textfield
    @IBOutlet weak var mPasswordField: UITextField!
    
    // outlet of logoImage
    @IBOutlet weak var mLogo: UIImageView!
    
    // outlet of login Button
    @IBOutlet weak var mLoginButton: UIButton!
    
    // outlet of login view
    @IBOutlet weak var mLoginView: UIView!
    
    // outlet of login activity indicator
    @IBOutlet weak var mLoginActivityIndicator: UIActivityIndicatorView!
    
    // variable to hold email
    var mEmail:String?
    
    // variable to hold password
    var mPassword:String?
    
    // boolean variable for offset check
    var mOffsetCheckBOOL = false
    
    // variable of type login view model
    var mloginViewModelObj:LoginViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mLoginActivityIndicator.isHidden = true
        mLoginView.layer.shadowColor = UIColor.black.cgColor
        mLogo.layer.shadowColor = UIColor.black.cgColor
        
        // create object of login view model
        mloginViewModelObj = LoginViewModel(loginViewProtocolObj: self)
    }
    
    // action for login button and validating email id and password
    
    @IBAction func loginBtn(_ sender: UIButton)
    {
        mLoginActivityIndicator.isHidden = false
        mLoginActivityIndicator.startAnimating()
        mEmail = mEmailField.text
        mPassword = mPasswordField.text
        
        if mEmail == "" || mPassword == ""
        {
            // display alert message if entered email and password is incorrect
            let alert = UIAlertController(title: "Alert", message: "Enter Valid emailId and Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            mLoginActivityIndicator.isHidden = true
            mLoginActivityIndicator.stopAnimating()
        }
            
        else
        {
            let value = self.validateUser(enteredEmail: mEmail!, enteredPassword: mPassword!)
            
            if value {
                // performing api call to validate email and password
                mloginViewModelObj?.sendEmailPasswordToController(email: mEmail!, password: mPassword!)
            }
                
            else {
                let alert = UIAlertController(title: "Alert", message: "Enter Valid emailId and Password", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                mLoginActivityIndicator.isHidden = true
                mLoginActivityIndicator.stopAnimating()
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
        if(mloginViewModelObj?.mResponseStatus == 200)
        {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        else if(mloginViewModelObj?.mResponseStatus == 401)
        {
            mLoginActivityIndicator.isHidden = true
            mLoginActivityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Alert", message: "user doesn't exist", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(mloginViewModelObj?.mResponseStatus == 304)
        {
            mLoginActivityIndicator.isHidden = true
            mLoginActivityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Alert", message: "oops! Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
}









