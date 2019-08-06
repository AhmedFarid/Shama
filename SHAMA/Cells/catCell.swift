//
//  catCell.swift
//  SHAMA
//
//  Created by Farido on 8/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class catCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
//        image.layer.cornerRadius = 5.0
//        image.layer.borderWidth = 0.0
//        image.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    func configuerCell(prodect: category) {
        title.text = prodect.name
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.photo)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
}
