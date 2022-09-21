//
//  FeedViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var actionButtonFirst: UIButton = {
        let actionButtonFirst = UIButton(configuration: .tinted())
        actionButtonFirst.setTitle("Show Post", for: .normal)
        return actionButtonFirst
    }()
    
    private lazy var actionButtonSecond: UIButton = {
        let actionButtonSecond = UIButton(configuration: .tinted())
        actionButtonSecond.setTitle("Show Post", for: .normal)
        return actionButtonSecond
    }()
    
    
    private lazy var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        return buttonsStackView
    }()
    
    private let post = MockModel.posts.first!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        title = "Feed"
        
        addSubviews()
        makeConstraints()
        setupTargets()
    }
    
    
    private func addSubviews() {
        view.addSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(actionButtonFirst)
        buttonsStackView.addArrangedSubview(actionButtonSecond)
    }
    
    
    private func setupTargets() {
        actionButtonFirst.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        actionButtonSecond.addTarget(self, action: #selector(showPost), for: .touchUpInside)
    }
    
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 200),
            buttonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }
    
}

// MARK: Actions
private extension FeedViewController {
    @objc private func showPost() {
        let postViewController = PostViewController()
        postViewController.post = post
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
