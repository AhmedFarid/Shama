//
//  loginVC.swift
//  SHAMA
//
//  Created by Farido on 8/1/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner.isHidden = true
        
        
    }

    @IBAction func loginBTN(_ sender: Any) {
        
        guard let passwords = password.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("login", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let emails = email.text, !emails.isEmpty else {
            let messages = NSLocalizedString("enter your email", comment: "hhhh")
            let title = NSLocalizedString("login", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        self.spiner.startAnimating()
        self.spiner.isHidden = false
        
        API_Auth.login(email: email.text ?? "", password: password.text ?? ""){ (error, success, data, status, message) in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Login Filed", message: "\(message ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(message ?? "")")
            }
            
            self.spiner.stopAnimating()
            self.spiner.isHidden = true
            
        }
    }
}
