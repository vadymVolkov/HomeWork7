//
//  ViewController.swift
//  HomeWork7
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellCountPerRow = 3
    let cellMargin: CGFloat = 10
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(identifier: "New Photo Controller") as AddNewPhotoViewController
        vc.navigationItem.title = "Add New Photo"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let categoryCount = Storage.countCategory
        var sectionNum = 0
        for i in 0 ..< categoryCount {
            if section == i {
                sectionNum = Storage.getPicturesCountByCategoryNumber(categoryNum: i)
            }
        }
        return sectionNum
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return Storage.countCategory
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture Cell", for: indexPath)
        let categoryCount = Storage.countCategory
        let tapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        for i in 0 ..< categoryCount {
            if indexPath.section == i {
                let itemsInCategory = Storage.getItemsArrayByCategoryNumber(categoryNum: i)
                let currentItem = itemsInCategory[indexPath.item]
                for view in cell.contentView.subviews {
                    if let imageView = view as? UIImageView {
                        imageView.tag = currentItem.id
                        imageView.image = UIImage(named: currentItem.fileName)
                        imageView.isUserInteractionEnabled = true
                        imageView.addGestureRecognizer(tapGestureRecognizer)
                    }
                }
            }
        }
        return cell
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        let optionMenu = UIAlertController(title: nil, message: "Выбирите действие:", preferredStyle: .actionSheet)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { (action:UIAlertAction) in
            print("add")
            //how to add picture to APP
        }
        let changeAction = UIAlertAction(title: "Изменить", style: .default) { (action:UIAlertAction) in
           print("change")
            //how to change picture data
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (action:UIAlertAction) in
            let id = tappedImage.tag
            Storage.deletePictureById(id: id)
            
            self.collectionView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        optionMenu.addAction(addAction)
        optionMenu.addAction(changeAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: "Header View",
                                                                   for: indexPath) as! HeaderCell
        let categoryCount = Storage.countCategory
        for i in 0 ..< categoryCount {
            if indexPath.section == i {
                let itemsInCategory = Storage.getItemsArrayByCategoryNumber(categoryNum: i)
                if itemsInCategory.count > 0 {
                    let currentItem = itemsInCategory[indexPath.item]
                    view.headerText!.text = currentItem.category.rawValue
                } else {
                    view.headerText!.text = ""
                }
            }
        }
        return view
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor((UIScreen.main.bounds.width - CGFloat(cellCountPerRow + 1) * cellMargin) / CGFloat(cellCountPerRow))
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryCount = Storage.countCategory
        for i in 0 ..< categoryCount {
            if indexPath.section == i {
                let itemsInCategory = Storage.getItemsArrayByCategoryNumber(categoryNum: i)
                let currentItem = itemsInCategory[indexPath.item]
                let vc = self.storyboard!.instantiateViewController(identifier: "Details Controller") as DetailsController
                vc.navigationItem.title = "Picture Info"
                vc.picture = currentItem
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
}
