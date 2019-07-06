//
//  ImageViewController.swift
//  Photos
//
//  Created by Drew Boowee on 7/5/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
     @IBOutlet weak var imageView: UIImageView!
    
    let imageSelect = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageSelect.delegate = self
        
    }
    
    func takePhotoWithCamera()
    {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            Alert(title: "No Camera", message: "This device has no camera")
        }
        else
        {
            imageSelect.allowsEditing = false
            imageSelect.sourceType = .camera
            present(imageSelect, animated: true, completion: nil)
        }
    }
    
    func Alert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
            picker.dismiss(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                imageView.image = image
            }
        }
    
    @IBAction func choosePhoto(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        else
        {
            Alert(title: "Error Message", message: "Could not load Photos")
            return
        }
        
        imageSelect.allowsEditing = false
        imageSelect.sourceType = .photoLibrary
        
        present(imageSelect, animated: true, completion: nil)
    }

//        imagePickerController.allowsEditing = false
//        imagePickerController.sourceType = .photoLibrary
//        present(imagePickerController, animated: true, completion: nil)
    
    
    
    
}
