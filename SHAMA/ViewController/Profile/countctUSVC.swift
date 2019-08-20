//
//  countctUSVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class countctUSVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var message: roundedTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func sendMsgTV(_ sender: Any) {
        API_Profile.counectUS(name: nameTF.text ?? "", phone: phone.text ?? "", message: message.text ?? "") { (error, string, message) in
            self.showAlert(title: "Contact us", message: message ?? "")
        }
    }
}
