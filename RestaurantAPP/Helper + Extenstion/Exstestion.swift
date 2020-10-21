//
//  Exstestion.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/11/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
extension LoginVC:getToDos{
    func getDataSuccessfully() {
        print("SUCCESS")
        let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.HomeVCStoryboard)
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func showError(error: String) {
        print("ERROR")
    }
    
    
}
@available(iOS 13.0, *)
extension MenuHomeVC:getToDo{
    func getDataSuccessfully() {
        CatrogyCV.reloadData()
        HomeTV.reloadData()
        
    }
    
    func showError(error: String) {
        print("ERROR")
    }
    
    
}

@available(iOS 13.0, *)
extension CartVC:getToD{
    func getDataSuccessfully() {
        CartTV.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
