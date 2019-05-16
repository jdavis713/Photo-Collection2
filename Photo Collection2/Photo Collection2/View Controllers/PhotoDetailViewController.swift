//
//  PhotoDetailViewController.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: -Actions
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = imageDetailTextField.text, !title.isEmpty,
        let image = imageDetailView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Functions
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        if themePreference == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        } else if themePreference == "Purple" {
            view.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageDetailView.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        imageDetailView.image = UIImage(data: photo.imageData)
        imageDetailTextField.text = photo.title
    }
    
    //MARK: -Properties

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet var imageDetailView: UIImageView!
    @IBOutlet var imageDetailTextField: UITextField!
    
}
