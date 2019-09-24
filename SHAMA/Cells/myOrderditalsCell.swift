//
//  myOrderditalsCell.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myOrderditalsCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    var rate: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        bounds = bounds.inset(by: padding)
//
//    }
//
    
    override var frame: CGRect {
      get {
          return super.frame
      }
      set (newFrame) {
          var frame =  newFrame
          frame.origin.y += 4
          frame.size.height -= 2 * 5
          super.frame = frame
      }
    }
    
    func configuerCell(prodect: myordersDitals) {
        //offores.text = "\(prodect.offer) % OFFER"
        name.text = prodect.name
        price.text = "\(prodect.price)$"
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
    
    
    @IBAction func reteProdect(_ sender: Any) {
        rate?()
    }
}
