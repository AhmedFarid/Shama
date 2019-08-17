//
//  homeData.swift
//  SHAMA
//
//  Created by Farido on 8/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class homeData: NSObject {

}

class banners: NSObject {
    
    var image: String
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string else {return nil}
        self.image = image
        
    }
}

//"name": "Test category 1",
//"photo": "15644818577333.jpg",
//"id": 23

class category: NSObject {
    
    var name: String
    var photo: String
    var id: Int
    
    
    init?(dict: [String: JSON]){
        
        guard let name = dict["name"]?.string,let photo = dict["photo"]?.string,let id = dict["id"]?.int else {return nil}
        self.name = name
        self.photo = photo
        self.id = id
        
    }
}


class bestDimond: NSObject {
    
    var id: Int
    var name: String
    var details: String
    var photo: String
    var SalesPrice: String
    var OriginalPrice: String
    var offer: String
    var caliber: String
    var favorite: String
    var Rate: Int
    var total_rate_av: Int
    
    
    init?(dict: [String: JSON]){
        if let total_rate_av = dict["total_rate_av"]?.int {
            self.total_rate_av = total_rate_av
        }else {
            self.total_rate_av = 0
        }
        
        if let Rate = dict["Rate"]?.int {
            self.Rate = Rate
        }else {
            self.Rate = 0
        }
        
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let details = dict["details"]?.string,let photo = dict["photo"]?.string,let SalesPrice = dict["SalesPrice"]?.string,let OriginalPrice = dict["OriginalPrice"]?.string,let offer = dict["offer"]?.string,let caliber = dict["caliber"]?.string,let favorite = dict["favorite"]?.string else {return nil}
        self.name = name
        self.photo = photo
        self.id = id
        self.details = details
        self.SalesPrice = SalesPrice
        self.OriginalPrice = OriginalPrice
        self.offer = offer
        self.caliber = caliber
        self.favorite = favorite
        
    }
}
