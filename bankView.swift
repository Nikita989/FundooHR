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
    @IBOutlet var tf1:UITextField?
    @IBOutlet var tf2:UITextField?
    @IBOutlet var tf3:UITextField?
    @IBOutlet var tf4:UITextField?
    @IBOutlet var tf5:UITextField?
    @IBOutlet var tf6:UITextField?
    //activity indicator for bank view
    @IBOutlet var bankActivityIndicator:UIActivityIndicatorView?
    // Buttons
    @IBOutlet var bankSaveBtn:UIButton?
    @IBOutlet var bankCancelBtn:UIButton?
    @IBOutlet var bankEditBtn:UIButton?
}
