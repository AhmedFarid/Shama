//
//  profileVC.swift
//  SHAMA
//
//  Created by Farido on 8/19/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var payed: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var orders: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getProifle()
    }
    
    func getProifle(){
        API_Profile.profileData { (error, data, message, totalOrder, totalProduct, paid, names, emails, phone, photo) in
            
            self.name.text = names ?? ""
            self.email.text = emails ?? ""
            self.number.text = phone ?? ""
            self.payed.text = "\(paid ?? 0) $ Payed"
            self.product.text = "\(totalProduct ?? 0) Product"
            self.orders.text = "\(totalProduct ?? 0) Orders"
            
        }
    }
    
    
    
    
    @IBAction func logoutBtn(_ sender: Any) {
        helper.dleteAPIToken()
    }
    
}
