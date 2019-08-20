//
//  forgetPasswordVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class forgetPasswordVC: UIViewController {

    @IBOutlet weak var emaiTF: UITextField!
    @IBOutlet weak var passwrodTF: UIButtonView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func passwordBTN(_ sender: Any) {
        API_Auth.forgetPassword(email: emaiTF.text ?? "") { (error, data, message) in
            self.showAlert(title: "forget Password", message: message ?? "" )
        }
    }
}
