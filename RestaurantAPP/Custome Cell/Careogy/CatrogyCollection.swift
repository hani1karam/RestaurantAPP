//
//  CatrogyCollection.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class CatrogyCollection: UICollectionViewCell,reloadCellTitles {
    
    
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var footer: UIView!
    func reloadTitle(title: String) {
        titletext.text = title
        
    }
}
