//
//  API+Home.swift
//  SHAMA
//
//  Created by Farido on 8/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class API_Home: NSObject {
    
    class func banner (completion: @escaping (_ error: Error?,_ sparParts: [banners]?)-> Void) {
        
        let url = URLs.categoriesBannerHome
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [banners]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = banners.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func categories (completion: @escaping (_ error: Error?,_ sparParts: [category]?)-> Void) {
        
        let url = URLs.categoriesAll
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [category]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = category.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }

    
    class func bestDaimond (completion: @escaping (_ error: Error?,_ sparParts: [bestDimond]?)-> Void) {
        
        let url = URLs.categoriesBestDiamond
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
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

}
