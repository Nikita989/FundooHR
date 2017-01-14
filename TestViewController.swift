//
//  TestViewController.swift
//  Fundo
//
//  Created by BridgeLabz Solutions LLP  on 12/22/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TestViewController: UIViewController {

    
    @IBOutlet weak var calender: JTAppleCalendarView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        calender.dataSource = self
        calender.delegate = self
        calender.registerCellViewXib(file: "CellView")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TestViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = formatter.date(from: "2016 02 01")! // You can use date generated from a formatter
        let endDate = Date()                                // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday)
        return parameters
    }
}

extension TestViewController: JTAppleCalendarViewDelegate
{
//    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
//        let myCustomCell = cell as! CellView
//        
//        // Setup Cell text
//        myCustomCell.dayLabel.text = cellState.text
//        
//        // Setup text color
//        if cellState.dateBelongsTo == .thisMonth {
//            myCustomCell.dayLabel.textColor = UIColor.black
//        } else {
//            myCustomCell.dayLabel.textColor = UIColor.gray
//        }
//    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        
        let myCustomCell = cell as! CellView
        
        myCustomCell.dayLabel.text = cellState.text
        
        if cellState.dateBelongsTo == .thisMonth {
            myCustomCell.dayLabel.textColor = UIColor.black
        }
        else
        {
            myCustomCell.dayLabel.textColor = UIColor.gray
        }
    }
}

//extension UIColor {
//    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
//        self.init(
//            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(value & 0x0000FF) / 255.0,
//            alpha: alpha
//        )
//    }
//}
