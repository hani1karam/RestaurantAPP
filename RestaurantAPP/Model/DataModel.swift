//
//  DataModel.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
struct DataModel : Codable {
    let status : Bool?
    let message : String?
    let data : ShowData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case data = "data"
    }
}
struct ShowData : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let phone : String?
    let image : String?
    let points : Int?
    let credit : Double?
    let token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case image = "image"
        case points = "points"
        case credit = "credit"
        case token = "token"
    }
}
