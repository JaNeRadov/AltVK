//
//  LoginViewController.swift
//  AltVK
//
//  Created by Jane Z. on 21.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
     override func viewDidLoad() {
        super.viewDidLoad()
   
         let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
         self.view.addGestureRecognizer(tapRecognizer)
         
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    
    
    @objc func keyboardDidShow(){
         print("KeyboardShow")
    }
    
    
    
    @objc func onTap(){
        self.view.endEditing(true)
    }
    
    
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
   
}
