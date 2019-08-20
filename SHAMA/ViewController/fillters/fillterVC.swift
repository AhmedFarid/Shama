//
//  fillterVC.swift
//  SHAMA
//
//  Created by Farido on 8/17/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class fillterVC: UIViewController {
    
    @IBOutlet weak var forWomenBtn: UIButton!
    @IBOutlet weak var formenBten: UIButton!
    @IBOutlet weak var styleCollectionView: UICollectionView!
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var mainTF: UITextField!
    @IBOutlet weak var maxTF: UITextField!
    
    
    var typeMen = ""
    var styleId = ""
    var typeCliber = ""
    
    var types = [prodectTypeGold]()
    var prodectStyle = [prodectStylessss]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleCollectionView.dataSource = self
        styleCollectionView.delegate = self
        textEnabeld()
        createTypePiker()
        handleRefreshgetStyle()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? filterResultVC{
            destaiantion.maxPrice = maxTF.text ?? ""
            destaiantion.minPrice = mainTF.text ?? ""
            destaiantion.typeMen = typeMen
            destaiantion.styleId = styleId
            destaiantion.typeCliber = typeCliber
            
        }
    }
    
    
    @objc private func handleRefreshgetStyle() {
        API_Favirot.prodectStyles{(error: Error?, prodectStyle: [prodectStylessss]?,message) in
            if let prodectStyle = prodectStyle {
                self.prodectStyle = prodectStyle
                print("xxx\(self.prodectStyle)")
                self.styleCollectionView.reloadData()
            }
        }
    }
    
    @objc private func handleRefreshgetProdectType() {
        API_Favirot.prodectStyle{(error: Error?, types: [prodectTypeGold]?,data) in
            if let types = types {
                self.types = types
                print("xxx\(self.types)")
                self.textEnabeld()
            }
        }
    }
    
    func textEnabeld() {
        
        if types.isEmpty == true {
            typeTF.isEnabled = false
        }else {
            typeTF.isEnabled = true
        }
        
    }
    
    func createTypePiker(){
        let type = UIPickerView()
        type.delegate = self
        type.dataSource = self
        type.tag = 1
        typeTF.inputView = type
        handleRefreshgetProdectType()
        type.reloadAllComponents()
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
        
        typeTF.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func forwomenAction(_ sender: Any) {
        typeMen = "1"
        forWomenBtn.setImage(UIImage(named: "Group 233"), for: .normal)
        formenBten.setImage(UIImage(named: "Group 232"), for: .normal)
        
    }
    
    @IBAction func formanActionBTN(_ sender: Any) {
        typeMen = "2"
        forWomenBtn.setImage(UIImage(named: "Group 125"), for: .normal)
        formenBten.setImage(UIImage(named: "Group 290"), for: .normal)
    }
    
    @IBAction func filterBTN(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
}

extension fillterVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(types[row].name)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTF.text = "\(types[row].name)"
        typeCliber = "\(types[row].id)"
        
    }
}


extension fillterVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        styleId = prodectStyle[indexPath.row].id
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodectStyle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = styleCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? styleCell {
            let bannner = prodectStyle[indexPath.row]
            cell.configuerCell(prodect: bannner)
            return cell
        }else {
            return styleCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = styleCollectionView.frame.size
        return CGSize(width: (size.width)/2.3, height: size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
