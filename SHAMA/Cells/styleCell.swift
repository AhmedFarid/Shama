//
//  styleCell.swift
//  SHAMA
//
//  Created by Farido on 8/17/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class styleCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
       
    }
    
    override var isSelected: Bool {
        didSet{
            layer.cornerRadius = isSelected ? 5.0 : 0.0
            layer.borderWidth =  isSelected ? 1.0 : 0.0
            layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func configuerCell(prodect: prodectStylessss) {
        name.text = prodect.name
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
}

