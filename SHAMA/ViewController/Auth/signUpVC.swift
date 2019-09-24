//
//  signUpVC.swift
//  SHAMA
//
//  Created by Farido on 8/1/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class signUpVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConform: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var spenier: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spenier.isHidden = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItems = []
        self.navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func loginBackBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! loginVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false, completion: nil)
        
        
    }
    
    @IBAction func signUPBTN(_ sender: Any) {
        
        guard let names = name.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        guard let addresss = address.text, !addresss.isEmpty else {
            let messages = NSLocalizedString("enter your Address", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let emails = email.text, !emails.isEmpty else {
            let messages = NSLocalizedString("enter your email", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = password.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwordConforms = passwordConform.text, !passwordConforms.isEmpty else {
            let messages = NSLocalizedString("enter your confirm password", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        guard password.text?.count ?? 0 >= 8 else {
            let messages = NSLocalizedString("password at least 8", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard passwordConform.text?.count ?? 0 >= 8 else {
            let messages = NSLocalizedString("password at least 8", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard password.text == passwordConform.text else {
            let messages = NSLocalizedString("password and confirm password must be the same", comment: "hhhh")
            let title = NSLocalizedString("register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        guard isValidInput(Input: name.text!) == true else {
            self.showAlert(title: "register", message: "Full name not correct")
            return
        }
        
        
        guard isValidEmail(testStr: email.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        self.spenier.startAnimating()
        self.spenier.isHidden = false
        
        API_Auth.register(name: name.text ?? "", email: email.text ?? "", password: password.text ?? "", address: address.text ?? "", phone: phone.text ?? "") { (error, success, data, status, message) in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
            }
            
            self.spenier.stopAnimating()
            self.spenier.isHidden = true
            
        }
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidInput(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ أ إ  ض ص ث ق ف غ ع ه خ ح  ج د ش ي ب ل ا ت ن م ك  ط ئ ء ؤ ر لا ى ة و ز ظ")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        print("\(isValid)")
        
        return isValid
    }
}
