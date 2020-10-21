//
//  MenuHomePresnter.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
protocol reloadCellTitles {
    func reloadTitle(title: String)
}
protocol reloadCellImage {
    func reloadImage(image: ProductModelDatum)
}
protocol reloadCelProudctlTitles {
    func reloadProductTitle(title: String)
}
protocol reloadCellProudctImage {
    func reloadProductImage(image: ProductModelDatum)
}
protocol reloadCelProudctlPrice {
    func reloadCelProudctlPrice(price: Double)
}

protocol getToDo {
    func getDataSuccessfully()
    func showError(error: String)
}

@available(iOS 13.0, *)
class MenuHomePresnter:BasePresenter{
    var view: MenuHomeVC?
    var loginModel:CatrogyModel?
    private var catoragt = [Datum]()
    private var product = [ProductModelDatum]()
    var id:String?
    var addcart:AddCartModel?
    init(view: MenuHomeVC) {
        self.view = view
    }
    func ShowCatrogy(){
        view?.showLoading()
        disposable = requestManager.ShowCatrogy().subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            print(response.status ?? "")
            if response.status == true{
                print("SUCCESS")
                guard let data = response.data?.data else{return}
                self?.catoragt = data
                self?.view?.getDataSuccessfully()
            }
            else{
                self?.view?.showToast(message: response.message ?? "")
                print("FAILUR")
            }
        })
        
    }
    func showProduct()  {
        view?.showLoading()
        disposable = requestManager.ShowProduct().subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            print(response.status ?? "")
            if response.status == true{
                print("SUCCESS")
                guard let data = response.data?.data else{return}
                self?.product = data
                self?.view?.getDataSuccessfully()
            }
            else{
                self?.view?.showToast(message: response.message ?? "")
                print("FAILUR")
            }
        })
        
    }
    func AddToCart(ProductId:String){
        view?.showLoading()
        disposable = requestManager.AddCart(ProductID: ProductId).subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            print(response.status ?? "")
            if response.status == true{
                self?.view?.showToast(message: response.message ?? "")
                self?.addcart = response
                self?.view?.getDataSuccessfully()
            }
            else{
                self?.view?.showToast(message: response.message ?? "")
                print("FAILUR")
            }
        })
        
    }
    
    func titlesCount() -> Int{
        return catoragt.count
    }
    func labelsCount() -> Int{
        return product.count
    }
    
    func reloadTitles(cell: reloadCellTitles, index: Int){
        cell.reloadTitle(title: catoragt[index].name ?? "")
        
    }
    
    func reloadCelProudctlTitles(cell: reloadCelProudctlTitles, index: Int){
        cell.reloadProductTitle(title: product[index].name ?? "")
        
    }
    func reloadCelProudctlPrice(cell: reloadCelProudctlPrice, index: Int){
        cell.reloadCelProudctlPrice(price: product[index].price ?? 0.0)
        
    }
    func reloadCellProudctImage(cell: reloadCellProudctImage, index: Int){
        cell.reloadProductImage(image: product[index])
    }
    var idsArray: [Int] {
        get {
            return product.map { $0.id ?? 0}
        }
    }
    var namesArray: [String] {
        get {
            return product.map { ($0.name ?? "")}
        }
    }
    var imageArray: [String] {
        get {
            return product.map { ($0.image ?? "" )
                
            }
            
        }
    }
    
    
}

