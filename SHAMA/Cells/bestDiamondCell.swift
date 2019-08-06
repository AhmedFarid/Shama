//
//  bestDiamondCell.swift
//  SHAMA
//
//  Created by Farido on 8/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class bestDiamondCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var offores: UILabel!
    @IBOutlet weak var fivart: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var orginalPrice: UILabel!
    
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    func configuerCell(prodect: bestDimond) {
        offores.text = "\(prodect.offer) % OFFER"
        if prodect.favorite == "0"{
            fivart.image = UIImage(named: "favorite")
        }else if prodect.favorite == "1"{
            fivart.image = UIImage(named: "favorite-heart-button")
        }
        name.text = prodect.name
        size.text = prodect.caliber
        price.text = "\(prodect.OriginalPrice) $"
        orginalPrice.text = "\(prodect.SalesPrice)$"
        img.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.photo)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url)
        }
    }
}

