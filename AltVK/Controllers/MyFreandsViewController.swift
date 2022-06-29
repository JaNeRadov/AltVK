//
//  MyFreandsController.swift
//  AltVK
//
//  Created by Jane Z. on 31.05.2022.
//

import UIKit

class MyFreandsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let fromFriendListToGalery = "fromFriendListTogalery"
    
    // MARK: - функция добавления друзей
    func filldata() -> [Friend] {
        let friendOne = Friend(name: "Stive", age: "25", avatar: "circle", photoAlbum: ["circle", "ball", "Pinguin"])
        let friendTwo = Friend(name: "Jane", age: "23", avatar: "ball", photoAlbum: ["ball", "Iam", "Mario"])
        let friendThree = Friend(name: "Jake", age: "25", avatar: "Iam", photoAlbum: ["Iam", "circle","Bike"])
        var frieandsArray = [Friend]()
        frieandsArray.append(friendOne)
        frieandsArray.append(friendTwo)
        frieandsArray.append(friendThree)
        return frieandsArray
    }
    
    var myFrieands = [Friend]()
    let customeTableViewCellReusedIdentifire = "customeTableViewCellReusedIdentifire"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFrieands = filldata()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customeTableViewCellReusedIdentifire)
        
        
    }
    func tableView (_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction (at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func deleteAction (at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction (style: .destructive, title: "Delete"){
            (action, view, comlition) in
            self.myFrieands.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .middle)
        }
        action.backgroundColor = UIColor.red
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}







