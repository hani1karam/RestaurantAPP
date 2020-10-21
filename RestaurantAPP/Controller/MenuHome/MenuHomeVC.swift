//
//  MenuHomeVC.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
protocol DelegateItemSelected {
    var name: String? {get set}
    var image: String? {get set}
}
@available(iOS 13.0, *)
class MenuHomeVC: BaseViewController,DelegateItemSelected{
    @IBOutlet weak var CatrogyCV: UICollectionView!
    @IBOutlet weak var HomeTV: UITableView!
    
    var catrogy:MenuHomePresnter!
    var selectedIndex = 0
    var productsToShow = [ProductModelDatum]()
    var allProduct = [ProductModelDatum]()
    var name: String?
    var image: String?
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CatrogyCV.delegate = self
        CatrogyCV.dataSource = self
        catrogy = MenuHomePresnter(view: self)
        catrogy.ShowCatrogy()
        HomeTV.delegate = self
        HomeTV.dataSource = self
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        HomeTV.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        self.HomeTV.separatorStyle = .none
        catrogy.showProduct()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Deatils = segue.destination as! DetailsVC
        Deatils.delegate = self
        Deatils.delegate?.name = catrogy.namesArray[index]
        Deatils.delegate?.image = catrogy.imageArray[index]
        
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func ShowCartButton(_ sender: Any) {
        let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.CartVCtoryboard)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
@available(iOS 13.0, *)
extension MenuHomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catrogy.titlesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatrogyCollection", for: indexPath) as! CatrogyCollection
        catrogy.reloadTitles(cell: cell, index: indexPath.row)
        if selectedIndex == indexPath.row{
            cell.footer.isHidden = false
            cell.titletext.font = UIFont(name: "Cairo-SemiBold", size: 19)
        }else{
            cell.footer.isHidden = true
            cell.titletext.font = UIFont(name: "Cairo-Light", size: 19)
            
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.CatrogyCV.reloadData()
        
    }
    
    
}
@available(iOS 13.0, *)
extension MenuHomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catrogy.labelsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        catrogy.reloadCelProudctlTitles(cell: cell, index: indexPath.row)
        catrogy.reloadCellProudctImage(cell: cell, index: indexPath.row)
        catrogy.reloadCelProudctlPrice(cell: cell, index: indexPath.row)
        cell.AddCartButton.tag = indexPath.row
        cell.AddCartButton.addTarget(self, action: #selector(subscribe(_:)), for: .touchUpInside)
        
        return cell
    }
    @objc func subscribe(_ sender: UIButton){
        let param = "\(catrogy.idsArray[sender.tag])"
        
        catrogy.AddToCart(ProductId: param)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "Home", sender: self)
        
        
    }
}
