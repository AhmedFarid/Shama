//
//  myorderCell.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myorderCell: UITableViewCell {

    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    override func awakeFromNib() {
        //        image.layer.cornerRadius = 5.0
        //        image.layer.borderWidth = 0.0
        //        image.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
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
    
    func configuerCell(prodect: myorders) {
        data.text = prodect.orderDate
        id.text = "ORD\(prodect.id)"
        price.text = "\(prodect.totalPrice)$"
        status.text = prodect.status
    }
}
