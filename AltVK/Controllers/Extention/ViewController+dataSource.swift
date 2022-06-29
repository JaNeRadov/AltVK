//
//  ViewController+dataSource.swift
//  AltVK
//
//  Created by Jane Z. on 07.06.2022.
//

import UIKit

extension MyFreandsViewController: UITableViewDataSource {
    
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
extension AllGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        let group = groups[indexPath.row]
        cell.configure(image: UIImage(named: group.avatar), name: group.name, description: group.description)
        cell.configure(self.groups[indexPath.row])
        return cell
    }
}

extension MyGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        let group = groups[indexPath.row]
        cell.configure(image: UIImage(named: group.avatar), name: group.name, description: group.description)
        cell.configure(self.groups[indexPath.row])
        return cell
    }
}

extension GaleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.photoAlbom.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellReuseIdentifire, for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(image:UIImage(named: self.photoAlbom[indexPath.item]) )
        
        return cell
    }
}
