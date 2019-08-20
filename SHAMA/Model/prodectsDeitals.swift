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

class prodectStylessss: NSObject {
    var id: String
    var name: String
    var image: String
    
    init?(dict: [String: JSON]){
        
        if let image = dict["style_image"]?.string {
            self.image = image
        }else {
            self.image = ""
        }
        
        
        guard let id = dict["style_id"]?.string,let name = dict["style_name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
}



class prodectTypeGold: NSObject {
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
}

class cartData: NSObject {
    var id: Int
    var name: String
    var photo: String
    var totalprice: Int
    var price: String
    var qty: String
    var taxes: String
    var caliber: String
    var delivery_fees: String
    var size: String
    
    init?(dict: [String: JSON]){
        
        if let size = dict["size"]?.string {
            self.size = size
        }else {
            self.size = "0"
        }
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let photo = dict["photo"]?.string,let totalprice = dict["totalprice"]?.int,let price = dict["price"]?.string,let qty = dict["qty"]?.string,let taxes = dict["taxes"]?.string,let caliber = dict["caliber"]?.string,let delivery_fees = dict["delivery_fees"]?.string else {return nil}
        self.id = id
        self.name = name
        self.photo = photo
        self.totalprice = totalprice
        self.price = price
        self.qty = qty
        self.taxes = taxes
        self.caliber = caliber
        self.delivery_fees = delivery_fees
        
    }
}

//"": 78,
//"": "75.00",
//"": "2019-08-19",
//"": "pending",
//"": "hgh",
//"": "card",
//"": "20.00",
//"": "cvvgg",
//"": null


class myorders: NSObject {
    var id: Int
    var totalPrice: String
    var orderDate: String
    var status: String
    var address: String
    var payment_type: String
    var deliveryFees: String
    var city: String
    var taxes: String
    
    init?(dict: [String: JSON]){
        
        if let taxes = dict["taxes"]?.string {
            self.taxes = taxes
        }else {
            self.taxes = "0"
        }
        
        guard let id = dict["id"]?.int,let totalPrice = dict["totalPrice"]?.string,let orderDate = dict["orderDate"]?.string,let status = dict["status"]?.string,let address = dict["address"]?.string,let payment_type = dict["payment_type"]?.string,let deliveryFees = dict["deliveryFees"]?.string,let city = dict["city"]?.string else {return nil}
        self.id = id
        self.totalPrice = totalPrice
        self.orderDate = orderDate
        self.status = status
        self.address = address
        self.payment_type = payment_type
        self.deliveryFees = deliveryFees
        self.city = city
    }
}


//"": "Bracelets",
//"id": 52,
//"": "15650168794723.jpg",
//"": "100.00"

class myordersDitals: NSObject {
    var id: Int
    var name: String
    var photo: String
    var price: String

    
    init?(dict: [String: JSON]){
        
       
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let photo = dict["photo"]?.string,let price = dict["price"]?.string else {return nil}
        self.id = id
        self.name = name
        self.photo = photo
        self.price = price
    }
}
