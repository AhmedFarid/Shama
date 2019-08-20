//
//  checkOutVC.swift
//  SHAMA
//
//  Created by Farido on 8/19/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class checkOutVC: UIViewController {

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var totalPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBAction func checkOUtBTN(_ sender: Any) {
        
        API_Favirot.createOrders(phone: phoneTF.text ?? "", totalPrice: totalPrice, address: addressTF.text ?? "", city: cityTF.text ?? "", payment_type: "card") { (error, data,massage)  in
            if massage == ""{
                self.showAlert(title: "Checkout", message: "Error in Checkout")
            }else {
                let alert = UIAlertController(title: "Checkout", message: massage ?? "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,  handler: { action in
                   self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}
