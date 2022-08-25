//
//  ProfileViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/25/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileView = ProfileView.createView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureProfileView()
    }
    
    private func configureProfileView() {
        view.addSubview(profileView)
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
