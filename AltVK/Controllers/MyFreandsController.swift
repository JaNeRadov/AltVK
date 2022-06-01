//
//  MyFreandsController.swift
//  AltVK
//
//  Created by Jane Z. on 31.05.2022.
//

import UIKit

class MyFreandsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func filldata() -> [Friend] {
        let friendOne = Friend(name: "Stive", age: "25", avatar: "circle", photoAlbum: [])
        let friendTwo = Friend(name: "Jane", age: "23", avatar: "ball", photoAlbum: [])
        let friendThree = Friend(name: "Jake", age: "25", avatar: "Iam", photoAlbum: [])
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
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(catchMessage(_:)), name: Notification.Name("sendMessageFromAllGroups"), object: nil)
    }
    
    
    
    @objc func catchMessage(_ notification: Notification) {
        
    
        
    }
   

}

 extension MyFreandsController: UITableViewDataSource {
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return myFrieands.count
     }

     
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: customeTableViewCellReusedIdentifire, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
         
         let friend = myFrieands[indexPath.row]
         cell.configure(image: UIImage(named: friend.avatar!), name: friend.name, description: friend.age)
         
         return cell
     }
     
     
     
 }

extension MyFreandsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
