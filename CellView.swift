//
//  CellView.swift
//  FundooHR-Client

//  purpose:
//  1.create outlets for calendar cell

//  Created by BridgeLabz on 14/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CellView: JTAppleDayCellView {
    @IBOutlet weak var dayLabel: UILabel!            // outlet of label
    @IBOutlet weak var markImageView: UIImageView!   // outlet of image view
    
}
