//
//  CartTableViewCell.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/21/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell,reloadCellProudctImag,reloadCelProudctlTitl {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ViewHome: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UI()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
    func reloadCellProudctImag(image: ProductDataClass) {
        if let img = URL(string: image.image ?? ""){
            DispatchQueue.main.async {
                
                self.img.kf.setImage(with: img)
                
            }
            
        }
    }
    
    func reloadCelProudctlTitl(title: String) {
        name.text = title
    }
    
}
