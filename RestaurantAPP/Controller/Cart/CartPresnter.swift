//
//  CartPresnter.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/21/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//
protocol getToD {
    func getDataSuccessfully()
    func showError(error: String)
}
protocol reloadCellProudctImag {
    func reloadCellProudctImag(image: ProductDataClass)
}
protocol reloadCelProudctlTitl {
    func reloadCelProudctlTitl(title: String)
}
import Foundation
@available(iOS 13.0, *)
class CartPresnter:BasePresenter{
    var view: CartVC?
    var loginModel:ShowCart?
    private var product = [ProductDataClass]()
    init(view: CartVC) {
        self.view = view
    }
    func ShowCartTapped(){
        view?.showLoading()
        disposable = requestManager.ShowCart().subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            guard let data = response.product else{return}
            self?.product = [data]
            self?.view?.getDataSuccessfully()
            
            print("SUCCESS")
            
        })
        
    }
    
    
    func titlesCount() -> Int{
        return product.count
    }
    func reloadCellProudctImag(cell: reloadCellProudctImag, index: Int){
        cell.reloadCellProudctImag(image: product[index])
    }
    func reloadCelProudctlTitles(cell: reloadCelProudctlTitl, index: Int){
        cell.reloadCelProudctlTitl(title: product[index].name ?? "")
        
    }
}

