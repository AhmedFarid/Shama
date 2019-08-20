//
//  rateVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class rateVC: UIViewController {

    @IBOutlet weak var stars: CosmosView!
    @IBOutlet weak var commentTF: UITextField!
    
    var singleItem = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(singleItem)

    }
    

    
    @IBAction func rateBTN(_ sender: Any) {
        API_Profile.rateprodect(product_id: "\(singleItem)", stars: "\(stars?.rating ?? 0.0)", comment: commentTF.text ?? "") { (error, data, massage) in
            if massage == "Validation Error."{
                self.showAlert(title: "Rate", message: massage ?? "")
            }else {
            let alert = UIAlertController(title: "Rate", message: massage ?? "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,  handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        }
        
        //self.navigationController?.popViewController(animated: true)
        }
    }
