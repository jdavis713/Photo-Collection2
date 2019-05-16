//
//  PhotosCollectionViewController.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotosCell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhoto" {
            guard let addDetailVC = segue.destination as? PhotoDetailViewController else { return }
            
            addDetailVC.photoController = photoController
            addDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "PhotoDetail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photo = photo
            
        } else if segue.identifier == "ThemeSelection" {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            
            themeSelectionVC.themeHelper = themeHelper
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        } else if themePreference == "Purple" {
            collectionView.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
    }
    

    //MARK: -Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
