//
//  InfoViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var actionButton =  UIButton(configuration: .tinted())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureActionButton()
    }
    
    
    private func configureActionButton() {
        view.addSubview(actionButton)
        
        actionButton.setTitle("Show Alert", for: .normal)
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
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
