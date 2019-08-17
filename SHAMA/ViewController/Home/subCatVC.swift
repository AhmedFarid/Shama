//
//  subCatVC.swift
//  SHAMA
//
//  Created by Farido on 8/8/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatVC: UIViewController {

    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var singleItem: category?
    var subCat = [category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.dataSource = self
        colletionView.delegate = self
        getSup()
        setUpPage()
        
    }
    
    func setUpPage(){
        titles.text = singleItem?.name ?? ""
    }
    
    func getSup(){
        self.spiner.isHidden = false
        self.spiner.startAnimating()
        API_Home.Subcategories(category_id: singleItem?.id ?? 0) { (error, subCat: [category]?) in
            
            if let subCat = subCat {
                self.subCat = subCat
                print("xxx\(self.subCat)")
                self.colletionView.reloadData()
            }
            
            if subCat?.count == 0{
                self.colletionView.isHidden = true
            }
            self.spiner.isHidden = true
            self.spiner.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? allProductVC{
            destaiantion.singleItme = sender as? category
        }
    }
}

extension subCatVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? catCell{
            let cat = subCat[indexPath.row]
            cell.configuerCell(prodect: cat)
            return cell
        }else {
            return catCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "suge", sender: subCat[indexPath.row])
    }
    
    
}
