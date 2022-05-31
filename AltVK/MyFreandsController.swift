//
//  MyFreandsController.swift
//  AltVK
//
//  Created by Jane Z. on 31.05.2022.
//

import UIKit

class MyFreandsController: UIViewController {

    @IBOutlet weak var receiverLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(catchMessage(_:)), name: Notification.Name("sendMessageFromAllGroups"), object: nil)
    }
    
    
    @objc func catchMessage(_ notification: Notification){
        
        if let text = notification.object as? String {
            receiverLabel.text = text
        }
        
    }
   

}
