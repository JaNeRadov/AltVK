//
//  MyGroupViewController.swift
//  AltVK
//
//  Created by Jane Z. on 07.06.2022.
//

import UIKit

class MyGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var groups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuseC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
       tableView.dataSource = self
       tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didPressToGrope(_:)), name: Notification.Name("pressToGroup"), object: nil)
   }
    
    @objc func didPressToGrope(_ notification: Notification) {
        guard let group = notification.object as? Group else {return}
        
        if !groups.contains(where: {groupItem in groupItem.name == group.name
        }) {
            groups.append(group)
            tableView.reloadData()
        }
            
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
