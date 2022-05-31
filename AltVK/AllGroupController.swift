//
//  AllGroupController.swift
//  AltVK
//
//  Created by Jane Z. on 31.05.2022.
//

import UIKit

class AllGroupController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func pressSendButton(_ sender: Any) {
        if let text = messageTextField.text {
            NotificationCenter.default.post(name: Notification.Name("sendMessageFromAllGroups"), object: text)            
        }
        
    }
    

}
