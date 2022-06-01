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
   
         
         //MARK: - скрытие клавиатуры
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
   
    
    //MARK: - Простая проверка логина и пароля 
    @IBOutlet weak var wellcomeLable: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let toTabBarController = "toTabBarController"
    
    
    @IBAction func loginButton(_ sender: Any) {
//        if let name = loginTextField.text, name == "admin"  {
//            loginTextField.backgroundColor = UIColor.green
//        }else{
//            loginTextField.backgroundColor = UIColor.red
//        }
//        if let password = passwordTextField.text, password == "admin"{
//            passwordTextField.backgroundColor = UIColor.green
//        }else{
//            passwordTextField.backgroundColor = UIColor.red
//        }
        
        performSegue(withIdentifier: toTabBarController, sender: nil)
    }
    
}
