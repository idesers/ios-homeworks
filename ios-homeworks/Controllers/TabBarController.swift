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
        UINavigationBar.appearance().prefersLargeTitles = true
    }

    private func configureControllers() {
        let feedFlow = UINavigationController(rootViewController: FeedViewController())
        let profileFlow = UINavigationController(rootViewController: LogInViewController())
        
        feedFlow.tabBarItem = UITabBarItem(
            title: "Feed",
            image: Resources.Icons.house,
            tag: 0
        )
        
        profileFlow.tabBarItem = UITabBarItem(
            title: "Profile",
            image: Resources.Icons.person,
            tag: 1
        )
        
        setViewControllers([feedFlow, profileFlow], animated: false)
    }
}

