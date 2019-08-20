//
//  API+Profile.swift
//  SHAMA
//
//  Created by Farido on 8/19/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Profile: NSObject {
    class func profileData(completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?,_ totalOrder: Int?,_ totalProduct: Int?,_ paid: Int?,_ name: String?,_ email: String?,_ phone:String?,_ photo: String?)-> Void) {
        
        let url = URLs.categoriesprofile
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
            ] as [String : Any]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil,nil,nil,nil,nil,nil,nil,nil)
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error,nil,nil,nil,nil,nil,nil,nil,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["message"].string else{
                    completion(nil,nil,nil,nil,nil,nil,nil,nil,nil,nil)
                    return
                }
                
                if let totalOrder = json["data"][0]["paid"].int{
                    let totalProduct = json["data"][0]["totalProduct"].int
                    let paid = json["data"][0]["paid"].int
                    let name = json["data"][0]["name"].string
                    let email = json["data"][0]["email"].string
                    let phone = json["data"][0]["phone"].string
                    let photo = json["data"][0]["photo"].string
                    completion(nil, nil,messsage,totalOrder,totalProduct,paid,name,email,phone,photo)
                }
                
            }
        }
    }
    
    class func counectUS(name: String,phone: String,message: String,completion: @escaping (_ error: Error?,_ messsage: String?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesContactUs
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "name": name,
            "phone": phone,
            "message": message
            ] as [String : Any]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil)
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsagez = json["message"].string else{
                    completion(nil,nil,nil)
                    return
                }
                
                if let messsage = json["message"].string{
                    completion(nil, messsagez,messsage)
                }
                
            }
        }
    }
    
    class func myorder (completion: @escaping (_ error: Error?,_ sparParts: [myorders]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesMyorder
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil)
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let dataArray = json["data"].array,let messsage = json["message"].string else{
                    completion(nil, nil,nil)
                    return
                }
                print(dataArray)
                print(messsage)
                var products = [myorders]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myorders.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func myorderDitales (order_id: String,completion: @escaping (_ error: Error?,_ sparParts: [myordersDitals]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesOrderDetails
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "order_id": order_id
        ]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil)
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let dataArray = json["data"].array,let messsage = json["message"].string else{
                    completion(nil, nil,nil)
                    return
                }
                print(dataArray)
                print(messsage)
                var products = [myordersDitals]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myordersDitals.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func rateprodect (product_id: String,stars: String,comment: String, completion: @escaping (_ error: Error?,_ messsage: String?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesAddRateComment
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": product_id,
            "stars": stars,
            "comment": comment
        ]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil)
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsagez = json["message"].string else{
                    completion(nil,nil,nil)
                    return
                }
                
                if let messsage = json["message"].string{
                    completion(nil, messsagez,messsage)
                }
                
            }
        }
    }
    
    class func editProfile (name: String,email: String,phone: String, completion: @escaping (_ error: Error?,_ messsage: String?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesEditProfile
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "lang": lang,
            "password": ""
        ]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil,nil)
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsagez = json["message"].string else{
                    completion(nil,nil,nil)
                    return
                }
                
                if let messsage = json["message"].string{
                    completion(nil, messsagez,messsage)
                }
                
            }
        }
    }
}
