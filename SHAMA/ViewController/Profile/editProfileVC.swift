//
//  editProfileVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class editProfileVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProifle()
    }
    
    
    func getProifle(){
        API_Profile.profileData { (error, data, message, totalOrder, totalProduct, paid, names, emails, phone, photo) in
            
            self.emailTF.text = names ?? ""
            self.nameTF.text = emails ?? ""
            self.phone.text = phone ?? ""
        }
    }
    @IBAction func editBTN(_ sender: Any) {
        API_Profile.editProfile(name: nameTF.text ?? "", email: emailTF.text ?? "", phone: phone.text ?? "") { (error, string, message) in
            self.showAlert(title: "Edit", message: message ?? "")
        }
    }
    
}
