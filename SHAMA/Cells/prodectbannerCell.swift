//
//  prodectbannerCell.swift
//  SHAMA
//
//  Created by Farido on 8/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class prodectbannerCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func awakeFromNib() {
        image.layer.cornerRadius = 5.0
        image.layer.borderWidth = 0.0
        image.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    func configuerCell(prodect: prodectImages) {
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.file)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
}
