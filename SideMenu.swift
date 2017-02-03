//
//  sideMenu.swift
//  Fundo

//  Purpose:
//  1.Populating side Menu
//  2.Perfoming Segue to the viewController

//  Created by BridgeLabz Solution LLP on 05/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class SideMenu: UIViewController {
    
    @IBOutlet weak var sideTableView: UITableView!  // outlet for side table view
    
    // Declaring and initializing array to populate the table cells
    var marray = ["Dashboard","Engineers","Attendance Summary","Reports","Clients"]
    
    
    // function to perform segue on click of logout button
    
    @IBAction func logOutButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to log out?", preferredStyle: UIAlertControllerStyle.alert)
        // add the actions (buttons)
        let lContinueAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
            UIAlertAction in
            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginView")
            self.present(view, animated: false, completion: nil)
        }
        
        let lCancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alert.addAction(lContinueAction)
        alert.addAction(lCancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideTableView.dataSource = self
        sideTableView.delegate = self
    }
    
}

// extension of table view data source
extension SideMenu:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! sideMenuTableViewCell
        // populating table cell
        cell.sideMenuCell.text = marray[indexPath.row]
        return cell
        
    }
}

// Extension of table view delegate
extension SideMenu : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            
            performSegue(withIdentifier: "segue", sender: nil)
        }
        
    }
}
