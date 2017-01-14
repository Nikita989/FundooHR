//
//  sideMenu.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 05/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class sideMenu: UIViewController {

    
    @IBOutlet weak var sideTableView: UITableView!
    var array = ["Dashboard","Engineers","Attendance Summary","Reports","Clients"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideTableView.dataSource = self
        sideTableView.delegate = self
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


extension sideMenu:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! sideMenuTableViewCell
        
        cell.sideMenuCell.text = array[indexPath.row]
        return cell
        
    }
}

extension sideMenu : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            
            performSegue(withIdentifier: "segue", sender: nil)
        }
        
    }
}
