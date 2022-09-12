//
//  FeedViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var actionButtonFirst = UIButton(configuration: .tinted())
    private var actionButtonSecond = UIButton(configuration: .tinted())
    private let buttonsStackView = UIStackView()
    
    private let post = Post(title: "This is post")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        title = "Feed"
        
        configureActionButtons()
        configureButtonsStackView()
    }
    
    
    private func configureActionButtons() {
        actionButtonFirst.setTitle("Show Post", for: .normal)
        actionButtonFirst.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        actionButtonSecond.setTitle("Show Post", for: .normal)
        actionButtonSecond.addTarget(self, action: #selector(showPost), for: .touchUpInside)
    }
    
    
    private func configureButtonsStackView() {
        view.addSubview(buttonsStackView)
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        buttonsStackView.addArrangedSubview(actionButtonFirst)
        buttonsStackView.addArrangedSubview(actionButtonSecond)
        
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 200),
            buttonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }
    
    
    @objc private func showPost() {
        let postViewController = PostViewController()
        postViewController.post = post
        
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
