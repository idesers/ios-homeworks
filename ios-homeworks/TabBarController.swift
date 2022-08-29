//
//  ViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/25/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureControllers()
    }
    
    private func configureAppearance() {
        UITabBar.appearance().tintColor = .label
    }

    private func configureControllers() {
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        
        feedNavigationController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: Resources.Icons.house,
            tag: 0
        )
        
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: Resources.Icons.person,
            tag: 1
        )
        
        setViewControllers([feedNavigationController, profileNavigationController], animated: false)
    }
}

