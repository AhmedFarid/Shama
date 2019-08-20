//
//  filterResultVC.swift
//  SHAMA
//
//  Created by Farido on 8/18/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class filterResultVC: UIViewController {

    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var colloctionView: UICollectionView!
    @IBOutlet weak var titles: UILabel!
    
    var singleItme: category?
    var prodects = [bestDimond]()
    
    var typeMen = ""
    var styleId = ""
    var typeCliber = ""
    var maxPrice = ""
    var minPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colloctionView.dataSource = self
        colloctionView.delegate = self
        getSup()
        setUpPage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //getSup()
        setUpPage()
    }
    
    func setUpPage(){
        titles.text = singleItme?.name ?? ""
    }
    
    func getSup(){
        
        self.spiner.isHidden = false
        self.spiner.startAnimating()
        
        API_Favirot.filterProdect(min_price: minPrice, max_price: maxPrice, type_cliber: typeCliber, style_id: styleId, type_men: typeMen) { (error, prodects: [bestDimond]?) in
            if let prodects = prodects {
                self.prodects = prodects
                print("llx\(self.prodects)")
                self.colloctionView.reloadData()
            }
            
            if prodects?.count == 0{
                self.colloctionView.isHidden = true
            }
            self.spiner.isHidden = true
            self.spiner.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? pordectDitelsVC{
            destaiantion.singleItem = sender as? bestDimond
        }
    }
    
    
}

extension filterResultVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bestDiamondCell{
            let cat = prodects[indexPath.row]
            cell.configuerCell(prodect: cat)
            return cell
        }else {
            return bestDiamondCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: 254  )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: prodects[indexPath.row])
    }
    
    
}
