//
//  FeedViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var actionButton = UIButton(configuration: .tinted())
    
    private let post = Post(title: "This is post")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        title = "Feed"
        
        configureActionButton()
    }
    
    
    private func configureActionButton() {
        view.addSubview(actionButton)
        
        actionButton.setTitle("Show Post", for: .normal)
        actionButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    @objc private func showPost() {
        let postViewController = PostViewController()
        postViewController.post = post
        
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
