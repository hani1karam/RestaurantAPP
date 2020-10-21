//
//  HomeTableViewCell.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell ,reloadCellProudctImage,reloadCelProudctlTitles,reloadCelProudctlPrice{
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pricee: UILabel!
    @IBOutlet weak var AddCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UI()
        
    }
    func UI() {
        ViewHome.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        ViewHome.layer.cornerRadius = 15.0
        //View.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        ViewHome.layer.masksToBounds = false
        ViewHome.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        ViewHome.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        ViewHome.layer.shadowOpacity = 0.8
        
        img.layer.cornerRadius = 15.0
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        ViewHome.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func reloadProductImage(image: ProductModelDatum) {
        if let img = URL(string: image.image ?? ""){
            DispatchQueue.main.async {
                
                self.img.kf.setImage(with: img)
                
            }
            
        }
    }
    func reloadProductTitle(title: String) {
        titlename.text = title
        
    }
    func reloadCelProudctlPrice(price: Double) {
        pricee.text = "Price: \(price) EG"
    }
}
