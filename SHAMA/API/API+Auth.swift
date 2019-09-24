//
//  API+Auth.swift
//  SHAMA
//
//  Created by Farido on 8/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Auth: NSObject {
    
    class func register(name: String,email: String, password: String,address: String,phone:String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?, _ message: String?)->Void) {
        
        let url = URLs.register
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "password": password,
            "address": address,
            "phone": phone
            ] as [String : Any]
        
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    if status == true {
                        if let token = json["data"]["token"].string, let name = json["data"]["name"].string, let email = json["data"]["email"].string, let phone = json["data"]["phone"].string, let message = json["message"].string  {
                            print("user token \(token)")
                            
                            helper.saveAPIToken(token: token, name: name, email: email, phone: phone)
                            completion(nil, true , nil,status,message)
                        }
                    }else {
                        let message = json["message"].string
                        print(message ?? "no")
                        completion(nil,false,nil,status,message)
                    }
                }
            }
        }
        
    }
    
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?, _ message: String?)->Void) {
        
        let url = URLs.login
        print(url)
        let parameters = [
            "email": email,
            "password": password
            ] as [String : Any]
        
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    if status == true {
                        if let token = json["data"]["token"].string, let name = json["data"]["name"].string, let email = json["data"]["email"].string, let phone = json["data"]["phone"].string, let message = json["message"].string  {
                            print("user token \(token)")
                            
                            helper.saveAPIToken(token: token, name: name, email: email, phone: phone)
                            completion(nil, true , nil,status,message)
                        }
                    }else {
                        let message = json["data"].string
                        print(message ?? "no")
                        completion(nil,false,nil,status,message)
                    }
                }
            }
        }
        
    }
    
    class func forgetPassword (email: String, completion: @escaping (_ error: Error?,_ messsage: String?,_ message: String?)-> Void) {
        
        let url = URLs.forgetPass
        print(url)
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "email": email
        ]
        print(parameters)
        
//        guard let userToken = helper.getAPIToken().token else {
//            completion(nil,nil,nil)
//            return
//        }
        
//        let headers = [
//            "Accept": "application/json",
//            "Authorization": "Bearer \(userToken)"
//        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let messsagez = json["data"].string else{
                    completion(nil,nil,nil)
                    return
                }
                
                if let messsage = json["data"].string{
                    completion(nil, messsagez,messsage)
                }
                
            }
        }
    }
}
