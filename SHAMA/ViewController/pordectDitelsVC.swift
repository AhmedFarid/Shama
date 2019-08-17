//
//  pordectDitelsVC.swift
//  SHAMA
//
//  Created by Farido on 8/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class pordectDitelsVC: UIViewController {
 
    @IBOutlet weak var bannerCollocationView: UICollectionView!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var reate: CosmosView!
    @IBOutlet weak var totalRate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var favortBtn: UIButton!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var TypeTF: UITextField!
    @IBOutlet weak var sizeTF: UITextField!
    
    var timer = Timer()
    var counter = 0
    var sizess = 0
    var typess = 0
    
    var prodectBanner = [prodectImages]()
    var sizes = [prodectSizes]()
    var types = [prodectType]()
    
    var singleItem: bestDimond?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        bannerCollocationView.dataSource = self
        bannerCollocationView.delegate = self
        
        handleRefreshgetBanner()
        
        textEnabeld()
        createTypePiker()
        createSizePiker()
    }
    
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pordectDitelsVC.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        TypeTF.inputAccessoryView = toolBar
        sizeTF.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc private func handleRefreshgetProdectSize() {
        API_Favirot.prodectSize(prodectID: singleItem?.id ?? 0){(error: Error?, sizes: [prodectSizes]?,data) in
            if let sizes = sizes {
                self.sizes = sizes
                print("xxx\(self.sizes)")
                self.textEnabeld()
                }
            }
        }
    
    @objc private func handleRefreshgetProdectType() {
        API_Favirot.prodectTypes(prodectID: singleItem?.id ?? 0){(error: Error?, types: [prodectType]?,data) in
            if let types = types {
                self.types = types
                print("xxx\(self.types)")
                self.textEnabeld()
            }
        }
    }
    
    func textEnabeld() {
        
        if sizes.isEmpty == true {
            sizeTF.isEnabled = false
        }else {
            sizeTF.isEnabled = true
        }
        
        if types.isEmpty == true {
            TypeTF.isEnabled = false
        }else {
            TypeTF.isEnabled = true
        }
    }
    
    func createSizePiker(){
        let sizex = UIPickerView()
        sizex.delegate = self
        sizex.dataSource = self
        sizex.tag = 0
        sizeTF.inputView = sizex
        handleRefreshgetProdectSize()
        sizex.reloadAllComponents()
    }
    
    func createTypePiker(){
        let type = UIPickerView()
        type.delegate = self
        type.dataSource = self
        type.tag = 1
        TypeTF.inputView = type
        handleRefreshgetProdectType()
        type.reloadAllComponents()
    }
    
    
    @objc private func handleRefreshgetBanner() {
        API_Favirot.Prodectbanner(prodectid: singleItem?.id ?? 0){(error: Error?, prodectBanner: [prodectImages]?) in
            if let prodectBanner = prodectBanner {
                self.prodectBanner = prodectBanner
                print("xxx\(self.prodectBanner)")
                self.bannerCollocationView.reloadData()
                self.page.numberOfPages =  prodectBanner.count
                self.page.currentPage = 0
                if prodectBanner.count != 0 {
                DispatchQueue.main.async {
                    self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                }
                }
            }
        }
    }
    
    @objc func changeImage() {
        
        if counter < prodectBanner.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollocationView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            page.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollocationView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            page.currentPage = counter
            counter = 1
        }
        
    }
    
    func setUpView(){
        reate.rating = Double(singleItem?.Rate ?? 0)
        reate.settings.updateOnTouch = false
        totalRate.text = "\(singleItem?.total_rate_av ?? 0) People review"
        price.text = "\(singleItem?.OriginalPrice ?? "") $"
        name.text = singleItem?.name
        type.text = singleItem?.caliber
        des.text = singleItem?.details
        if singleItem?.favorite == "0"{
            favortBtn.setImage(UIImage(named: "favorite-heart-button"), for: UIControl.State.normal)
        }else {
            favortBtn.setImage(UIImage(named: "favorite-heart-button-1"), for: UIControl.State.normal)
        }
        
    }
    
    
    @IBAction func addToFav(_ sender: Any) {
        API_Favirot.addFavProdect(prodectID: singleItem?.id ?? 0) { (error, status, massage) in
            if status == 0{
                self.favortBtn.setImage(UIImage(named: "favorite-heart-button"), for: UIControl.State.normal)
                print(massage ?? "")
            }else if status == 1 {
                self.favortBtn.setImage(UIImage(named: "favorite-heart-button-1"), for: UIControl.State.normal)
                 print(massage ?? "")
            }
        }
        
    }
    
    @IBAction func addToCartBTN(_ sender: Any) {
//        guard let type = TypeTF.text, !type.isEmpty else {
//            let messages = NSLocalizedString("enter Product Type", comment: "hhhh")
//            let title = NSLocalizedString("Add to cart", comment: "hhhh")
//            self.showAlert(title: title, message: messages)
//            return
//        }
        
//        guard let sizes = sizeTF.text, !sizes.isEmpty else {
//            let messages = NSLocalizedString("enter Product Size", comment: "hhhh")
//            let title = NSLocalizedString("login", comment: "hhhh")
//            self.showAlert(title: title, message: messages)
//            return
//        }
        API_Favirot.addCartProdect(prodectID: singleItem?.id ?? 0, qty: 1, standard_gold_id: typess, size_id: sizess) { (error, massage) in
            self.showAlert(title: "Add to cart", message: massage ?? "")
        }
    }
    
}


extension pordectDitelsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodectBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = bannerCollocationView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? prodectbannerCell {
            let bannner = prodectBanner[indexPath.row]
            cell.configuerCell(prodect: bannner)
            return cell
        }else {
            return prodectbannerCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = bannerCollocationView.frame.size
        return CGSize(width: size.width - 50, height: size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}


extension pordectDitelsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return sizes.count
        }else {
            return types.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return sizes[row].size
        }else {
            return "type: \(types[row].name) || price: \(types[row].price)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            sizeTF.text = sizes[row].size
            sizess = sizes[row].id
            //self.view.endEditing(false)
        }else{
            TypeTF.text = "type: \(types[row].name) || price: \(types[row].price)"
            typess = types[row].id
            //self.view.endEditing(false)
        }
    }
}
