//
//  Picture.swift
//  HomeWork7
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

struct Picture {
    let id: Int
    let fileName: String
    let category: CategoryType
    let dateCreated: String
    let cameraModel: String
    enum CategoryType: String {
        case people = "People"
        case tool = "Tool"
        case test = "Test"
        static let allValues = [tool, people, test]
    }
    
}
