//
//  DetailsController.swift
//  HomeWork7
//
//  Created by Vadym Volkov on 28.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var picture: Picture!
    
    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var cameraModel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        fileName.text = "Picture name: " + picture.fileName
        category.text = "Category: " + picture.category.rawValue
        dateCreated.text = "Date created: " + picture.dateCreated
        cameraModel.text = "Camera model: " + picture.cameraModel
    }
    

}
