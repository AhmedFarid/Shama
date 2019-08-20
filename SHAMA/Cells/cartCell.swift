//
//  cartCell.swift
//  SHAMA
//
//  Created by Farido on 8/18/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class cartCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var cliber: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var removeBTN: UIButton!
    @IBOutlet weak var minBTN: UIButton!
    
    var add: (()->())?
    var min: (()->())?
    var deleteBtn: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        bounds = bounds.inset(by: padding)
        
    }
    
    
    func configuerCell(prodect: cartData) {
        name.text = prodect.name
        size.text = "Size: \(prodect.size)"
        cliber.text = prodect.caliber
        price.text = "Total price: \(prodect.totalprice)$"
        qty.text = prodect.qty
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
    
    @IBAction func add(_ sender: Any) {
        add?()
    }
    
    @IBAction func min(_ sender: Any) {
        min?()
    }
    
    
    @IBAction func deleteBtn(_ sender: Any) {
        deleteBtn?()
    }
    
}

