//
//  homeVC.swift
//  SHAMA
//
//  Created by Farido on 8/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var bannerCollectionVIew: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var bestDimandCollectionView: UICollectionView!
    
    
    var timer = Timer()
    var counter = 0
    
    var banner = [banners]()
    var cat = [category]()
    var bestDimands = [bestDimond]()
    var cart = [cartData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionVIew.layer.cornerRadius = 5.0
        bannerCollectionVIew.layer.borderWidth = 0.0
        bannerCollectionVIew.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        categoriesCollectionView.layer.cornerRadius = 5.0
        categoriesCollectionView.layer.borderWidth = 0.0
        categoriesCollectionView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        bestDimandCollectionView.layer.cornerRadius = 5.0
        bestDimandCollectionView.layer.borderWidth = 0.0
        bestDimandCollectionView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        bannerCollectionVIew.delegate = self
        bannerCollectionVIew.dataSource = self
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        bestDimandCollectionView.delegate = self
        bestDimandCollectionView.dataSource = self
        
        
        handleRefreshgetBanner()
        handleRefreshgetCat()
        handleRefreshgetBestDimand()
        handleRefreshFavProdect()
    }
    
    
    func handleRefreshFavProdect() {
        print("xxxxxxx")
        API_Home.carts{(error: Error?, cart: [cartData]?,message) in
            if let cart = cart {
                self.cart = cart
                print("sdsds\(self.cart)")
                if let tabItems = self.tabBarController?.tabBar.items {
                    let tabItem = tabItems[2]
                    tabItem.badgeValue = "\(cart.count)"
                }
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //handleRefreshgetBanner()
        handleRefreshgetCat()
        handleRefreshgetBestDimand()
        //handleRefreshFavProdect()
    }
    
    
    @objc private func handleRefreshgetBanner() {
        API_Home.banner{(error: Error?, banner: [banners]?) in
            if let banner = banner {
                self.banner = banner
                print("xxx\(self.banner)")
                self.bannerCollectionVIew.reloadData()
                self.pageView.numberOfPages =  banner.count
                self.pageView.currentPage = 0
                if banner.count != 0{
                DispatchQueue.main.async {
                    self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                    }
                    
                }
            }
        }
    }
    
    
    @objc private func handleRefreshgetCat() {
        API_Home.categories{(error: Error?, cat: [category]?) in
            if let cat = cat {
                self.cat = cat
                print("xxx\(self.cat)")
                self.categoriesCollectionView.reloadData()
            }
        }
    }
    
    
    @objc private func handleRefreshgetBestDimand() {
        API_Home.bestDaimond{(error: Error?, bestDimands: [bestDimond]?) in
            if let bestDimands = bestDimands {
                self.bestDimands = bestDimands
                print("sdsds\(self.bestDimands)")
                self.bestDimandCollectionView.reloadData()
            }
        }
    }
    
    
    
    @objc func changeImage() {
        if counter < banner.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectionVIew.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectionVIew.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? pordectDitelsVC{
            destaiantion.singleItem = sender as? bestDimond
        }else if let destaiantion = segue.destination as? subCatVC{
            destaiantion.singleItem = sender as? category
        }
    }
    
}


extension homeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return banner.count
        }else if collectionView.tag == 1{
            return cat.count
        }else {
            return bestDimands.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = bannerCollectionVIew.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bannerCell {
                let bannner = banner[indexPath.row]
                cell.configuerCell(prodect: bannner)
                return cell
            }else {
                return bannerCell()
            }
        }else if collectionView.tag == 1 {
            if let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? catCell {
                let bannner = cat[indexPath.row]
                cell.configuerCell(prodect: bannner)
                return cell
            }else {
                return catCell()
            }
        }else {
            if let cell = bestDimandCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bestDiamondCell {
                let bannner = bestDimands[indexPath.row]
                cell.configuerCell(prodect: bannner)
                return cell
            }else {
                return bestDiamondCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 2{
            performSegue(withIdentifier: "suge", sender: bestDimands[indexPath.row])
        }else if collectionView.tag == 1{
            performSegue(withIdentifier: "subCatSuge", sender: cat[indexPath.row])
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }else if collectionView.tag == 1 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            let size = bannerCollectionVIew.frame.size
            return CGSize(width: size.width - 50, height: size.height)
        }else if collectionView.tag == 1 {
            let size = categoriesCollectionView.frame.size
            return CGSize(width: (size.width)/2.3, height: size.height)
        }else{
            let size = bestDimandCollectionView.frame.size
            return CGSize(width: (size.width)/1.5, height: size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 0 {
            return 10.0
        }else if collectionView.tag == 1{
            return 10.0
        }else{
            return 10.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 0{
            return 10.0
        }else if collectionView.tag == 1{
            return 10.0
        }else {
            return 10.0
        }
        
    }
}
