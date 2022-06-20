//
//  LoginViewController.swift
//  AltVK
//
//  Created by Jane Z. on 21.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loadViewOne: UIView!
    @IBOutlet weak var loadViewTwo: UIView!
    @IBOutlet weak var loadViewThree: UIView!
    
    
    //MARK: - анимация загрузки
    func loadAnimate() {
        loadViewOne.alpha = 1
        loadViewTwo.alpha = 0
        loadViewThree.alpha = 0
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.repeat]) { [weak self] in
                self?.loadViewOne.alpha = 0
                self?.loadViewTwo.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [.repeat]) { [weak self] in
                    self?.loadViewTwo.alpha = 0
                    self?.loadViewThree.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 1,
                               delay: 0,
                               options: [.repeat]) {  [weak self] in
                        self?.loadViewThree.alpha = 0
                        self?.loadViewOne.alpha = 1
                }
            }
        }
    }
    
    func viewAnimation() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadAnimate()
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
         loadViewOne.layer.cornerRadius = 20
         loadViewTwo.layer.cornerRadius = 20
         loadViewThree.layer.cornerRadius = 20
         
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
    @IBOutlet weak var vkLogoView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let toTabBarController = "toTabBarController"
    
    
    @IBAction func loginButton(_ sender: Any) {
        //MARK: - Анимация перехода с логинВью
        UIView.transition(with: wellcomeLable, duration: 0.5, options: []) { [weak self] in
            guard let self = self else {return}
            let translationWellcomeLabel = CGAffineTransform(translationX: 300, y: 0)
            self.wellcomeLable.transform = translationWellcomeLabel
        }
        UIView.transition(with: vkLogoView, duration: 0.5, options: []) { [weak self] in
            guard let self = self else {return}
            let translationImage = CGAffineTransform(translationX: 0, y: -300)
            self.vkLogoView.transform = translationImage
        }
        UIView.transition(with: loginTextField, duration: 0.5, options: []) { [weak self] in
            guard let self = self else {return}
            let translationLoginText = CGAffineTransform(translationX: -300, y: 0)
            self.loginTextField.transform = translationLoginText
        }
        UIView.transition(with: passwordTextField, duration: 0.5, options: []) { [weak self] in
            guard let self = self else {return}
            let translationPasswordText = CGAffineTransform(translationX: 0, y: 300)
            self.passwordTextField.transform = translationPasswordText
        }




        performSegue(withIdentifier: toTabBarController, sender: nil)
    }
    
}
