//
//  PhotosCollectionViewCell.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let photoData = photo?.imageData else { return }
        imageView.image = UIImage(data: photoData)
        photoLabel.text = photo?.title
    }
    
    
    
    //MARK: -Properties

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var photoLabel: UILabel!
    
    
}
