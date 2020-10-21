//
//  DetailsVC.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ViewHome: UIButton!
    @IBOutlet weak var CounterCart: UILabel!

    var delegate: DelegateItemSelected?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let item = delegate {
            self.name.text = item.name
             self.img.kf.setImage(with: URL(string:item.image ?? ""))

            
        }
        
    }
    
    func UI() {
        ViewHome.backgroundColor = UIColor.white
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
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func increase(_ sender: Any) {
        guard var counter = Int(self.CounterCart.text!) else {return}
        counter += 1
        self.CounterCart.text = "\(counter)"
        CounterCart.text = self.CounterCart.text
        guard let total = Int(self.CounterCart.text!) else {return}
     

    }
    
    @IBAction func Decrease(_ sender: Any) {
        guard var counter = Int(self.CounterCart.text!) else {return}
        counter -= 1
        self.CounterCart.text = "\(counter)"
        CounterCart.text = self.CounterCart.text
        guard let total = Int(self.CounterCart.text!) else {return}
 
        
    }

}
