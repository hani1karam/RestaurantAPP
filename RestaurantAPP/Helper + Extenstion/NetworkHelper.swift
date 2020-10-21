//
//  NetworkHelper.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class NetworkHelper {
    
    static var accessToken: String?{
        didSet{
            UserDefaults.standard.set(accessToken, forKey: "token")
        }
    }
    
    static func getAccessToken() -> String? {
        if let accessToken = UserDefaults.standard.value(forKey: "token") as? String{
            NetworkHelper.accessToken = accessToken
            print("token: \(accessToken)")
        }
        return NetworkHelper.accessToken
    }
}
