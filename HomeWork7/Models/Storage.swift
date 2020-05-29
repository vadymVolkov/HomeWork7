//
//  File.swift
//  HomeWork7
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

struct Storage {
    private static var itemList = [
        Picture(id: 1, fileName: "picture1", category: .tool, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 2, fileName: "picture2", category: .tool, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 3, fileName: "picture3", category: .people, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 4, fileName: "picture4", category: .people, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 5, fileName: "picture4", category: .people, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 6, fileName: "picture1", category: .tool, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 7, fileName: "picture2", category: .tool, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 8, fileName: "picture3", category: .people, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 9, fileName: "picture2", category: .test, dateCreated: "11.11.2011", cameraModel: "Cannon"),
        Picture(id: 10, fileName: "picture3", category: .test, dateCreated: "11.11.2011", cameraModel: "Cannon")
        
    ]
    
    static var count: Int {
        itemList.count
    }
    
    static func item(at index: Int) -> Picture {
        return itemList[index % itemList.count]
    }
    static var countCategory: Int {
        Picture.CategoryType.allValues.count
    }
    static func getPicturesCountByCategoryNumber(categoryNum: Int) -> Int {
        let pictures: [Picture] = getItemsArrayByCategoryNumber(categoryNum: categoryNum)
        return pictures.count
        
        
    }
    
    static func deletePictureById(id: Int) {
        var i = 0
        for item in itemList {
            if item.id == id {
                itemList.remove(at: i)
            } else{
                i += 1
            }
        }
    }
    
    static func getItemByCategoryAndIndex(category: Picture.CategoryType, index: Int) -> Picture {
        let allitemsInCategory = getItemByCategory(category: category.rawValue)
        let item = allitemsInCategory[index]
        return item
    }
    static func getItemsArrayByCategoryNumber(categoryNum: Int) -> [Picture] {
        let allCategorys = Picture.CategoryType.allValues
        var pictures: [Picture] = []
        for picture in itemList {
            if picture.category == allCategorys[categoryNum] {
                pictures.append(picture)
            }
        }
        return pictures
        
    }
    static func getItemByCategory(category: String) -> [Picture] {
        var items: [Picture] = []
        for item in itemList {
            if item.category.rawValue == category {
                items.append(item)
            }
        }
        return items
    }
}


