//
//  PhotoController.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

class PhotoController {
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
        
        saveToPersistentStore()
    }
    
    //MARK: -Persistence
    
    func saveToPersistentStore() {
        
        guard let url = photoCollectionURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            print("Error saving photos: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManger = FileManager.default
        guard let url = photoCollectionURL, fileManger.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: data)
            photos = decodedPhotos
        } catch {
            print("Error loading from disk: \(error)")
        }
    }
    
    //MARK: Properties:
    
    var photos: [Photo] = []
    
    private var photoCollectionURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("PhotoCollection.plist")
    }
}
