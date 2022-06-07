//
//  VieController+Deligate.swift
//  AltVK
//
//  Created by Jane Z. on 07.06.2022.
//

import UIKit

extension MyFreandsViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromFriendListToGalery, let destinationController =  segue.destination as?  GaleryViewController, let photos = sender as? [String]{
            destinationController.photoAlbom = photos
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let photos = myFrieands[indexPath.row].photoAlbum
        performSegue(withIdentifier: fromFriendListToGalery, sender: photos)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension AllGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let group = groups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("pressToGroup"), object: group)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension MyGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension GaleryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(indexPath.item)
    }
}
