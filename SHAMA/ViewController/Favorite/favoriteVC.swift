//
//  favoriteVC.swift
//  SHAMA
//
//  Created by Farido on 8/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class favoriteVC: UIViewController {

    @IBOutlet weak var favoriteLableOut: UILabel!
    @IBOutlet weak var noFavorImageOut: UIImageView!
    @IBOutlet weak var noFavoirtLableOUt: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var favProdect = [bestDimond]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //spiner.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
       // handleRefreshFavProdect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.isHidden = false
        self.favoriteLableOut.isHidden = false
        handleRefreshFavProdect() 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? pordectDitelsVC{
            destaiantion.singleItem = sender as? bestDimond
        }
    }
    
    @objc private func handleRefreshFavProdect() {
        self.spiner.isHidden = false
        self.spiner.startAnimating()
        API_Favirot.categoriesFaveProduct{(error: Error?, favProdect: [bestDimond]?,message) in
            if message == "All products"{
                if let favProdect = favProdect {
                    self.favProdect = favProdect
                    print("sdsds\(self.favProdect)")
                    self.tableView.reloadData()
                }
            }else {
                self.tableView.isHidden = true
                self.favoriteLableOut.isHidden = true
            }
            self.spiner.isHidden = true
            self.spiner.stopAnimating()
        }
        
    }
    
}

extension favoriteVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favProdect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? favirotCell{
            let fav = favProdect[indexPath.row]
            cell.configuerCell(prodect: fav)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
//            cell.layoutSubviews()
//            let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//            cell.inset(by: padding)
            return cell
        }else {
        return favirotCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: favProdect[indexPath.row])
    }

}



