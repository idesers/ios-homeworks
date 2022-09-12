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
        
        configureProfileHeaderView()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    private func configureProfileHeaderView() {
        view.addSubview(profileHeaderView)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
