//
//  AuthAPI.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import Alamofire
enum AuthAPI {
    case LoginButton(email:String,Password:String)
    case ShowData
    case showCatrogy
    case showProduct
    case AddToCart(product_id:String)
    case ShowCart
}
extension AuthAPI: TargetType {
    
    var baseURL: String {
        return Endpoints.baseURL
    }
    
    var path: String {
        switch self {
            
        case .LoginButton(_,_):
            return  Endpoints.login
        case.ShowData:
            return Endpoints.GetData
        case .showCatrogy:
            return Endpoints.GetCatrogy
        case .showProduct:
            return Endpoints.GetProduct
        case .AddToCart:
            return Endpoints.AddToCart
        case .ShowCart:
            return Endpoints.SHOWToCart
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .LoginButton(_,_),.AddToCart(_):
            return .post
        case .showCatrogy,.showProduct,.ShowData,.ShowCart:
            return .get
            
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .LoginButton(let email,let password):
            return [
                "email":email,
                "password":password
            ]
        case .ShowData:
            return nil
        case .showCatrogy,.showProduct,.ShowCart:
            return nil
            
        case .AddToCart(let product_id):
            return[
                "product_id" : product_id
            ]
            
        }
    }
    var headers: [String : Any]? {
        switch self {
        case .LoginButton(_,_):
            return
                ["Content-Type":"application/json"]
        case .ShowData:
            return ["Content-Type":"application/json","Authorization": "7R9oMwcusybAT20X7x3BFzrHhpsrD8WU0IAq663pbE6aKrp6QlnexsLDktvkRLE00io4sR"]
        case .showCatrogy:
            return ["Content-Type":"application/json"]
        case .showProduct:
            return    ["Content-Type":"application/json","Authorization": "7R9oMwcusybAT20X7x3BFzrHhpsrD8WU0IAq663pbE6aKrp6QlnexsLDktvkRLE00io4sR"]
        case .AddToCart(_):
            return    ["Content-Type":"application/json","Authorization": "7R9oMwcusybAT20X7x3BFzrHhpsrD8WU0IAq663pbE6aKrp6QlnexsLDktvkRLE00io4sR"]
        case .ShowCart:
            return  ["Content-Type":"application/json","Authorization": "7R9oMwcusybAT20X7x3BFzrHhpsrD8WU0IAq663pbE6aKrp6QlnexsLDktvkRLE00io4sR"]
        }
    }
    var auth: [String : String]? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    
}
