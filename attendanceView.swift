//
//  attendanceView.swift
//  Fundo

//  purpose:
//  1. creating outlets for attendance view

//  Created by BridgeLabz Solution LLP on 07/12/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class attendanceView: UIView {
    // Buttons of attendance views
    @IBOutlet var attendanceEditBtn:UIButton?
    @IBOutlet var attendanceSaveBtn:UIButton?
    @IBOutlet var attendanceCancelBtn:UIButton?
    // labels
    @IBOutlet var inOutDateLabel:UILabel?
    @IBOutlet var reasonViewDate:UILabel?
    @IBOutlet var inOutVIewDate:UILabel?
    // textfields
    @IBOutlet var inTextField:UITextField?
    @IBOutlet var outTextField:UITextField?
    //textview
    @IBOutlet var reasonTextView:UITextView?
    // activity indicator for attendanceView
    @IBOutlet var attendanceActivityIndicator:UIActivityIndicatorView?
    
   }
