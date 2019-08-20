//
//  API+Favirot.swift
//  SHAMA
//
//  Created by Farido on 8/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Favirot: NSObject {
    class func categoriesFaveProduct (completion: @escaping (_ error: Error?,_ sparParts: [bestDimond]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesFaveProduct
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
                var products = [bestDimond]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = bestDimond.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func Prodectbanner (prodectid: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectImages]?)-> Void) {
        
        let url = URLs.categoriesProductsDetalis
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": prodectid
            ] as [String : Any]
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil)
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"][0]["images"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [prodectImages]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectImages.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func prodectSize (prodectID: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectSizes]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesSizeProduct
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": prodectID
            ] as [String : Any]
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
                var products = [prodectSizes]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectSizes.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func prodectTypes(prodectID: Int,completion: @escaping (_ error: Error?,_ sparParts: [prodectType]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesStandardGoldProduct
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": prodectID
            ] as [String : Any]
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
                var products = [prodectType]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectType.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func prodectStyles(completion: @escaping (_ error: Error?,_ sparParts: [prodectStylessss]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesStyle
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
            ] as [String : Any]
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
                var products = [prodectStylessss]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectStylessss.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    
    class func prodectStyle(completion: @escaping (_ error: Error?,_ sparParts: [prodectTypeGold]?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesStandardGold
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
            ] as [String : Any]
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
                var products = [prodectTypeGold]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodectTypeGold.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,messsage)
            }
        }
    }
    
    class func addFavProdect(prodectID: Int,completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?)-> Void) {
        
        let url = URLs.addFaveProduct
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": prodectID
            ] as [String : Any]
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
                guard let status = json["data"]["status"].int,let messsage = json["message"].string else{
                    completion(nil, nil,nil)
                    return
                }
                completion(nil, status,messsage)
            }
        }
    }
    
    
    class func addCartProdect(prodectID: Int,qty: Int,standard_gold_id: Int,size_id: Int,completion: @escaping (_ error: Error?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesAddCart
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "product_id": prodectID,
            "qty": qty,
            "standard_fold_id": standard_gold_id,
            "size_id": size_id
            ] as [String : Any]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil)
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["message"].string else{
                    completion(nil, nil)
                    return
                }
                completion(nil,messsage)
            }
        }
    }
    
    class func filterProdect (min_price: String,max_price: String,type_cliber: String,style_id: String, type_men: String,completion: @escaping (_ error: Error?,_ sparParts: [bestDimond]?)-> Void) {
        
        let url = URLs.categoriesFilterProduct
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "type_men": type_men,
            "style_id": style_id,
            "type_cliber": type_cliber,
            "max_price": max_price,
            "min_price": min_price
        ]
        print(parameters)
        
        guard let userToken = helper.getAPIToken().token else {
            completion(nil,nil)
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [bestDimond]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = bestDimond.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func deletCart(cart_id: Int,completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesDeleteCart
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "cart_id": cart_id
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
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["data"].string else{
                    completion(nil, nil,nil)
                    return
                }
                completion(nil, nil,messsage)
            }
        }
    }
    
    
    class func plusCart(cart_id: Int,completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesPlusCart
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "cart_id": cart_id
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
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["data"].string else{
                    completion(nil, nil,nil)
                    return
                }
                completion(nil, nil,messsage)
            }
        }
    }
    
    
    
    class func minCart(cart_id: Int,completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?)-> Void) {
        
        let url = URLs.categoriesminCart
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "cart_id": cart_id
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
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["data"].string else{
                    completion(nil, nil,nil)
                    return
                }
                completion(nil, nil,messsage)
            }
        }
    }
    
    class func createOrders(phone:String,totalPrice: Int,address: String,city: String,payment_type: String,completion: @escaping (_ error: Error?,_ status: Int?,_ message: String?)-> Void) {
        
        let url = URLs.createOrder
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "payment_type": payment_type,
            "city": city,
            "address": address,
            "totalPrice": totalPrice,
            "phone": phone
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
                completion(error, nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsage = json["message"].string else{
                    completion(nil, nil,nil)
                    return
                }
                completion(nil, nil,messsage)
            }
        }
    }
}
