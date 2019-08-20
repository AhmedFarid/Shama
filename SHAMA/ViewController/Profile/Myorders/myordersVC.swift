//
//  myordersVC.swift
//  SHAMA
//
//  Created by Farido on 8/20/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myordersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var myOrder = [myorders]()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? myordersDetialsVC{
            destaiantion.singleItem = sender as? myorders
        }
    }
    
    @objc private func handleRefreshFavProdect() {
        self.spiner.isHidden = false
        self.spiner.startAnimating()
        API_Profile.myorder{(error: Error?, myOrder: [myorders]?,message) in
            if message == "User orders."{
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

extension myordersVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myorderCell{
            let fav = myOrder[indexPath.row]
            cell.configuerCell(prodect: fav)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return myorderCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: myOrder[indexPath.row])
    }
    
}



