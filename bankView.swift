//
//  bankView.swift
//  Fundo

//  purpose:
//  1. creating outlets for bank view

//  Created by BridgeLabz Solution LLP on 07/12/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class bankView: UIView {
    //textfields of bank view
    @IBOutlet var mBankTextField1:UITextField?
    @IBOutlet var mBankTextField2:UITextField?
    @IBOutlet var mBankTextField3:UITextField?
    @IBOutlet var mBankTextField4:UITextField?
    @IBOutlet var mBankTextField5:UITextField?
    @IBOutlet var mBankTextField6:UITextField?
    //activity indicator for bank view
    @IBOutlet var bankActivityIndicator:UIActivityIndicatorView?
    // Buttons
    @IBOutlet var bankSaveBtn:UIButton?
    @IBOutlet var bankCancelBtn:UIButton?
    @IBOutlet var bankEditBtn:UIButton?
}
