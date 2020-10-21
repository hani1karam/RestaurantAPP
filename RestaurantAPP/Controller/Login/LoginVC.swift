//
//  ViewController.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LoginVC: BaseViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    var login:LoginPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login = LoginPresnter(view: self)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        login.LoginButtonClick()
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.RegisterStoryboard)
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

