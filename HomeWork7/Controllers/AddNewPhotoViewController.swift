//
//  AddNewPhotoViewController.swift
//  HomeWork7
//
//  Created by Vadym Volkov on 29.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class AddNewPhotoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openImageGallery(_ sender: UIBarButtonItem) {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType =  UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
}

extension AddNewPhotoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image_data = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        let imageData:Data = image_data.pngData()!
        //how to add picture to APP
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
