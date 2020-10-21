//
//  LoginPresnter.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/11/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import RxSwift

protocol getToDos {
    func getDataSuccessfully()
    func showError(error: String)
}

@available(iOS 13.0, *)
class LoginPresnter:BasePresenter{
    var view: LoginVC?
    var loginModel:LoginModel?
    var id:String?
    init(view: LoginVC) {
        self.view = view
    }
    func LoginButtonClick(){
        view?.showLoading()
        disposable = requestManager.LoginButtonc(username: (view?.EmailTextField.text)!, passwordField: (view?.PasswordTextField.text)!).subscribe(onNext: {[weak self] (response) in
            self?.view?.HideLoading()
            print(response.status ?? "")
            if response.status == true{
                print("SUCCESS")
                self?.view?.showToast(message: "تم تسجيل الدخول بنجاح")
                self?.loginModel = response
                self?.id = "\(response.data?.id! ?? 0)"
                let nc = NotificationCenter.default
                nc.post(name: Notification.Name("id"), object: nil)
                
                print(self?.id ?? "")
                
                self?.view?.getDataSuccessfully()
            }
            else{
                self?.view?.showToast(message: response.message ?? "")
                print("FAILUR")
            }
        })
        
    }
    
    
}

