//
//  TabBarController.swift
//  TablePractice
//
//  Created by Mariano Martin Battaglia on 29/07/2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        // 1rst Tab
        let firstTabTitle = "Home"
        let firstTabImage = UIImage(systemName: "house")
        
        let firstTab = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTab.title = firstTabTitle
        
        let firstNavigationViewController = UINavigationController(rootViewController: firstTab)
        firstNavigationViewController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
        // 2nd Tab
        let secondTabTitle = "Favorites"
        let secondTabImage = UIImage(systemName: "heart")
        
        let secondTab = ExampleViewController(nibName: "ExampleViewController", bundle: nil)
        secondTab.title = secondTabTitle
        
        let secondNavigationViewController = UINavigationController(rootViewController: secondTab)
        secondNavigationViewController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)
        
        viewControllers = [firstNavigationViewController, secondNavigationViewController]
    }
}
