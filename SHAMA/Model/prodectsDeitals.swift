//
//  prodectsDeitals.swift
//  SHAMA
//
//  Created by Farido on 8/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class prodectsDeitals: NSObject {

}


class prodectImages: NSObject {
    
    var file: String
    
    init?(dict: [String: JSON]){
        
        guard let file = dict["file"]?.string else {return nil}
        self.file = file
        
    }
}

//"id": 41,
//"size": "18"

class prodectSizes: NSObject {
    var id: Int
    var size: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let size = dict["size"]?.string else {return nil}
        self.id = id
        self.size = size
        
    }
}


class prodectType: NSObject {
    var id: Int
    var name: String
    var price: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let price = dict["price"]?.string else {return nil}
        self.id = id
        self.name = name
        self.price = price
    }
}
