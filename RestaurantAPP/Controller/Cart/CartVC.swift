//
//  CartVC.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class CartVC: BaseViewController {
    @IBOutlet weak var CartTV: UITableView!
    var cart:CartPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CartTV.delegate = self
        CartTV.dataSource = self
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        CartTV.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        self.CartTV.separatorStyle = .none
      //  cart.ShowCartTapped()

    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
@available(iOS 13.0, *)
extension CartVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
      //  cart.reloadCelProudctlTitles(cell: cell, index: indexPath.row)
       // cart.reloadCellProudctImag(cell: cell, index: indexPath.row)
        return cell
    }
    
    
}
