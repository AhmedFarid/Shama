//
//  myordersDetialsVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myordersDetialsVC: UIViewController {

    var singleItem: myorders?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var myOrder = [myordersDitals]()
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spiner.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        // handleRefreshFavProdect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.isHidden = false
        handleRefreshFavProdect()
    }
    
    
    
    @objc private func handleRefreshFavProdect() {
        self.spiner.isHidden = false
        self.spiner.startAnimating()
        API_Profile.myorderDitales(order_id: "\(singleItem?.id ?? 0)"){(error: Error?, myOrder: [myordersDitals]?,message) in
            if message == "User orders details."{
                if let myOrder = myOrder {
                    self.myOrder = myOrder
                    print("sdsds\(self.myOrder)")
                    self.tableView.reloadData()
                }
            }else {
                self.tableView.isHidden = true
                //self.favoriteLableOut.isHidden = true
            }
            self.spiner.isHidden = true
            self.spiner.stopAnimating()
        }
        
    }
    
}

extension myordersDetialsVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myOrderditalsCell{
            let fav = myOrder[indexPath.row]
            cell.configuerCell(prodect: fav)
            cell.rate = {
                self.id = fav.id
                print(fav.id)
                self.performSegue(withIdentifier: "suge", sender: nil)
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return myOrderditalsCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? rateVC{
            destaiantion.singleItem = id
        }
    }
}



