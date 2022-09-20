//
//  LogInViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/20/22.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var login = "" {
        didSet { updateLoginButtonState() }
    }
    
    private var password = "" {
        didSet { updateLoginButtonState() }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: Resources.Images.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = -0.5
        return stackView
    }()
    
    private lazy var loginTextField: CredentialsTextField = {
        let textField = CredentialsTextField()
        textField.placeholder = "Email or Phone"
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: CredentialsTextField = {
        let textField = CredentialsTextField(isSecure: true)
        textField.placeholder = "Password"
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.delegate = self
        return textField
    }()
    
    private lazy var loginButton = RoundedButton(title: "Log In", backgroundImage: Resources.Images.bluePixel)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        addSubviews()
        makeContraints()
        setupTargets()
        setupGestures()
        updateLoginButtonState()
    }
    
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(textFieldsStackView)
        scrollView.addSubview(loginButton)
        
        textFieldsStackView.addArrangedSubview(loginTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
    }
    
    
    private func makeContraints() {
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            textFieldsStackView.topAnchor.constraint(lessThanOrEqualTo: logoImageView.bottomAnchor, constant: 120),
            textFieldsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            textFieldsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding),
            textFieldsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: padding),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -padding),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    private func setupTargets() {
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forceHideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    private func updateLoginButtonState() {
        loginButton.isEnabled = !login.isEmpty && !password.isEmpty
    }
}



@objc private extension LogInViewController {
    
    func buttonAction() {
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
    
    func forceHideKeyboard() {
        view.endEditing(true)
    }
    
}



extension LogInViewController: UITextFieldDelegate {
    
}
