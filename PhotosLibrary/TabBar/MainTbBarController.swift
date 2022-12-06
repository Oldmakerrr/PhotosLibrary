//
//  MainTbBarController.swift
//  PhotosLibrary
//
//  Created by Apple on 20.01.2022.
//

import UIKit

class MainTbBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        viewControllers = [generateNavigationController(rootViewController: photosVC, image: "photo", title: "Photos"), generateNavigationController(rootViewController: ViewController(), image: "heart.circle.fill", title: "Favourites")]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, image: String, title: String) -> UIViewController {
        let navihationVC = UINavigationController(rootViewController: rootViewController)
        navihationVC.tabBarItem.title = title
        navihationVC.tabBarItem.image = UIImage.init(systemName: image)
        return navihationVC
    }
}
