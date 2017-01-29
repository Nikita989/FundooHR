//
//  utility.swift
//  Fundo

//  purpose:
//  1.utility class to fetch url from plist

//  Created by BridgeLabz Solution LLP on 25/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import Foundation

class utility: NSObject {
    
    // variable of type string to hold url
    var url:String?
    func fetchplistData() ->String
    {
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        if let dictArray = NSDictionary(contentsOfFile: path!) {
            url = dictArray["fundooHrUrl"] as! String
            
        }
        return url!
        
    }
    
    
    
}
