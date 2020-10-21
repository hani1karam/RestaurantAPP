//
//  TargetType.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import RxSwift
import Alamofire
protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: Any]? { get }
    var auth: [String: String]? { get }
    var encoding: ParameterEncoding { get }
}

extension TargetType {
    // return request after create url and add header and parameters
    func asURLRequest() throws -> URLRequest {
        var finalURL = URL(string: baseURL)
        finalURL = finalURL?.appendingPathComponent(path)
        guard let url = finalURL else {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Could not get URL"]
            )
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
      
        urlRequest.allHTTPHeaderFields = headers as? [String : String]
        urlRequest.timeoutInterval = TimeInterval(15 * 1000)
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
