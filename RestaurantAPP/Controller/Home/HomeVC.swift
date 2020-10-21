//
//  HomeVC.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/12/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import CircleMenu

@available(iOS 13.0, *)
class HomeVC: BaseViewController,CircleMenuDelegate {
    
    @IBOutlet weak var NameTxt: UILabel!
    var ShowData:HomePresnster!
    
    let items: [(icon: String, color: UIColor)] = [
        ("Group 1797-1", UIColor(red: 242/255, green: 156/255, blue: 48/255, alpha: 1)),
        ("Group 1798",UIColor(red: 242/255, green: 156/255, blue: 48/255, alpha: 1)),
        ("ic_delivery_en", UIColor(red: 242/255, green: 156/255, blue: 48/255, alpha: 1)),
        ("ic_dinein_en",UIColor(red: 242/255, green: 156/255, blue: 48/255, alpha: 1)),
        ("ic_reservaktion_en", UIColor(red: 242/255, green: 156/255, blue: 48/255, alpha: 1))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let circleButton = CircleMenu(frame: CGRect(x:self.view.frame.width / 2.6,y:self.view.frame.height / 1.6,width:100,height:100), normalIcon: "6", selectedIcon: "6", buttonsCount: 5, duration: 0.3, distance: 155)
        //hi
        
        // circleButton.backgroundColor = .red
        circleButton.delegate = self
        circleButton.layer.cornerRadius = circleButton.frame.size.width / 2.0
        
        self.view.addSubview(circleButton)
        circleButton.sendActions(for: .touchUpInside)
        
        ShowData = HomePresnster(view: self)
        ShowData.HomeButtonClick()
    }
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        
        print("button will selected: \(atIndex)")
        switch atIndex {
        case 0 :
            //  self.goToSelectedVC(IDScreen: ScreenID.RestaurantMenuVC)
            
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(UInt32(0.7)) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.MenuHomeVCtoryboard)
                               self.navigationController?.pushViewController(vc, animated: true)                })
            })
            
            
            
            
            
        case 1 :
            
            
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(UInt32(0.7)) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    //       self.goToSelectedVC(IDScreen: ScreenID.CarPickupVC)
                })
            })
            
            
        case 2 :
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(UInt32(0.7)) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    //     self.goToSelectedVC(IDScreen: ScreenID.AboutVC)
                })
            })
            
            
        case 3 :
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(UInt32(0.7)) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    //   self.goToSelectedVC(IDScreen: ScreenID.ReservationVC)
                })
            })
            
        case 4 :
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(UInt32(0.7))// 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    //         self.goToSelectedVC(IDScreen: ScreenID.DineInVC)
                })
            })
            
        default:
            print("+")
            
        }
        
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }
    
    
    
    
    
}
