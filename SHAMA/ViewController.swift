//
//  ViewController.swift
//  SHAMA
//
//  Created by Farido on 7/31/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.addMiddleImage()
    }

    func addMiddleImage(){
        //Initialize your UIImage
        let yourImage = UIImage(named: "Group 176")!.withRenderingMode(.alwaysOriginal)
        
        //Initialize a UIImageView
        let imageView = UIImageView(image: yourImage)
        
        //Set your Navigation Bar to the inialized UIImageView
        self.navigationItem.titleView = imageView
        
    }

}

