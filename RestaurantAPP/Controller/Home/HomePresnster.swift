//
//  HomePresnster.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
@available(iOS 13.0, *)
class HomePresnster:BasePresenter{
    var view: HomeVC?
    var loginModel:DataModel?
    var id:String?
    init(view: HomeVC) {
        self.view = view
    }
    func HomeButtonClick(){
        view?.showLoading()
        disposable = requestManager.ShowData().subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            print(response.status ?? "")
            if response.status == true{
                print("SUCCESS")
                DispatchQueue.main.async {
                    self?.view?.NameTxt.text = "Welcome"   +  " " +    (response.data?.name)! 
                    
                }
            }
            else{
                self?.view?.showToast(message: response.message ?? "")
                print("FAILUR")
            }
        })
        
    }
    
    
}

