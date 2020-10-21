//
//  View.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
extension UIView{
    func static_shadow(withOffset value:CGSize,color: CGColor){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 3.5
        self.layer.shadowOffset = value
        self.layer.shadowRadius = 6
        
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}

