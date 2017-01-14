//
//  dashBoardViewController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 05/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class dashBoardViewController: UIViewController {

    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    
    @IBOutlet weak var open: UIButton!
    
   
    var array = ["AttendanceSummary","AttendanceFallout","LeaveSummary","Engineers","clients","Reports"]

    override func viewDidLoad() {
        super.viewDidLoad()
        dashBoardCollectionView.dataSource = self
        dashBoardCollectionView.delegate = self
        open.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        

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

extension dashBoardViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashBoardCell", for: indexPath) as! dashboardCollectionViewCell
            
        
            
            cell.contentView.layer.cornerRadius = 8
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.cyan.cgColor
            
            cell.contentView.backgroundColor = UIColor.white
            cell.layer.shadowOpacity = 0.6
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.masksToBounds = false
            
            cell.collectionLabel.text = array[indexPath.row] 
        
        return cell
                
    
}

}

extension dashBoardViewController : UICollectionViewDelegate
{
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        if indexPath.row == 3 {
            
            
            performSegue(withIdentifier: "engineerSegue", sender: nil)
        }
    }
}

