//
//  ProfileViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame.inset(by: view.safeAreaInsets)
    }
}
