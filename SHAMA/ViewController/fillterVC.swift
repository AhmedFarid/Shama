//
//  fillterVC.swift
//  SHAMA
//
//  Created by Farido on 8/17/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class fillterVC: UIViewController {
    
    @IBOutlet weak var forWomenBtn: UIButton!
    @IBOutlet weak var formenBten: UIButton!
    @IBOutlet weak var styleCollectionView: UICollectionView!
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var mainTF: UITextField!
    @IBOutlet weak var maxTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func forwomenAction(_ sender: Any) {
        forWomenBtn.setImage(UIImage(named: "Group 233"), for: .normal)
        formenBten.setImage(UIImage(named: "Group 232"), for: .normal)
        
    }
    
    @IBAction func formanActionBTN(_ sender: Any) {
        forWomenBtn.setImage(UIImage(named: "Group 125"), for: .normal)
        formenBten.setImage(UIImage(named: "Group 290"), for: .normal)
    }
    
    @IBAction func filterBTN(_ sender: Any) {
    }
    
}

