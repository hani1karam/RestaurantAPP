//
//  BasePresnterProtco;.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/11/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
protocol BaseViewProtocol: class {
    func setLocalization()
    
    // Error Handling
    func showLoading()
    func hideLoading()
    func showLogin()
    func showBlockScreenWithRetry()
    func showScreenNoConnection()
    func showAlert(title: String?, message: String)
    func updateCartBadge(with value: Int)
    func checkDirectionRTL() -> Bool

}
protocol BasePresenterProtocol: class {
    func handelGloaplError(_ error: AppError, view: BaseViewProtocol?)
}
