//
//  ViewController+CollectionLayout.swift
//  AltVK
//
//  Created by Jane Z. on 07.06.2022.
//

import UIKit

extension GaleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let witeSpaces: CGFloat = 20
        let cellWidth = width / 3 - witeSpaces
        
       return CGSize(width: cellWidth , height: cellWidth + 20)
    }
}
