//
//  InfoViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let actionButton = UIButton(configuration: .tinted())
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle("Show Alert", for: .normal)
        return actionButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(actionButton)
        
        setupTargets()
        makeConstraints()
    }
    
    
    private func setupTargets() {
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}

// MARK: Actions
private extension InfoViewController {
    
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "'Show Alert' button pressed", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("alert - ok")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("alert - cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
