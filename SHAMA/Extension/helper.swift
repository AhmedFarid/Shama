//
//  helper.swift
//  SHAMA
//
//  Created by Farido on 8/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class helper: NSObject {
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        
        var vc: UIViewController
        if getAPIToken().token == nil {
            let sb = UIStoryboard(name: "Auth", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else {
            let sb = UIStoryboard(name: "Home", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func dleteAPIToken() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "token")
        def.removeObject(forKey: "name")
        def.removeObject(forKey: "email")
        def.removeObject(forKey: "phone")
        def.synchronize()
        
        restartApp()
    }
    
    class func saveAPIToken(token: String,name: String,email: String,phone: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "token")
        def.setValue(name, forKey: "name")
        def.setValue(email, forKey: "email")
        def.setValue(phone, forKey: "phone")
        def.synchronize()
        
        restartApp()
    }
    
    class func getAPIToken() -> (token: String?,name: String?, email: String?, phone: String?) {
        let def = UserDefaults.standard
        return (def.object(forKey: "token") as? String,def.object(forKey: "name") as? String,def.object(forKey: "email") as? String,def.object(forKey: "phone") as? String)
    }
}
