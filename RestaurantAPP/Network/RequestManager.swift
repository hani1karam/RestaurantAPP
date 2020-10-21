//
//  RequestManager.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/11/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
class RequestManager: APIClient {
    
    func LoginButtonc(username: String, passwordField: String) -> Observable<LoginModel> {
        return request(AuthAPI.LoginButton(email: username, Password: passwordField))
    }
    func ShowData() -> Observable<DataModel> {
        return request(AuthAPI.ShowData)
    }
    func ShowCatrogy() ->Observable<CatrogyModel>{
        return request(AuthAPI.showCatrogy)
        
    }
    func ShowProduct() -> Observable<ProductModel>{
        return request(AuthAPI.showProduct)
        
    }
    func AddCart(ProductID:String) -> Observable<AddCartModel>{
        return request(AuthAPI.AddToCart(product_id: ProductID))
    }
    func ShowCart() -> Observable<CartItemDataClass>{
        return request(AuthAPI.ShowCart)
        
    }
}
