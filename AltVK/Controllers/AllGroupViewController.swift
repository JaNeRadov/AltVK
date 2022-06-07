//
//  AllGroupController.swift
//  AltVK
//
//  Created by Jane Z. on 31.05.2022.
//

import UIKit

class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var groupTableView: UITableView!
   
    func fillData() -> [Group] {
        let groupOne = Group(name: "Bike Club", description: "Archangelsk", avatar: "Bike")
        let groupTwo = Group(name: "Pinguin Club", description: "Murmansk", avatar: "Pinguin")
        let groupThree = Group(name: "Nintendo Club", description: "Tokio", avatar: "Mario")
        var groups = [Group]()
        groups.append(groupOne)
        groups.append(groupTwo)
        groups.append(groupThree)
        
        return groups
    }
  
    var groups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuseC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = fillData()
        groupTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        groupTableView.dataSource = self
        groupTableView.delegate = self
   }
    
}






