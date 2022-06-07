//
//  GaleryViewController.swift
//  AltVK
//
//  Created by Jane Z. on 07.06.2022.
//

import UIKit

class GaleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoCollectionViewCellReuseIdentifire = "photoCollectionViewCellReuseIdentifire"
    
    var photoAlbom = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCollectionViewCellReuseIdentifire)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}
