//
//  PostViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = post?.title
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let infoBarButton = UIBarButtonItem(
            image: Resources.Icons.infoCircle,
            style: .plain,
            target: self,
            action: #selector(barButtonAction)
        )
        
        navigationItem.setRightBarButton(infoBarButton, animated: false)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
    @objc private func barButtonAction() {
        present(InfoViewController(), animated: true)
    }
    
}
