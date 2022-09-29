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
        scrollView.delaysContentTouches = false
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDidShow(_:)),
            name: UIResponder.keyboardDidShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDidHide(_:)),
            name: UIResponder.keyboardDidHideNotification,
            object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
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
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.logoVerticalPadding),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoHeight),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            textFieldsStackView.topAnchor.constraint(lessThanOrEqualTo: logoImageView.bottomAnchor, constant: Constants.logoVerticalPadding),
            textFieldsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.padding),
            textFieldsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.padding),
            textFieldsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: Constants.loginFormHeight),

            loginButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: Constants.padding),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.padding),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.padding),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Constants.padding),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
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
    
    
    func keyboardDidHide(_ notification: Notification) {
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    
    func keyboardDidShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardOriginY = keyboardFrame.cgRectValue.origin.y
        let loginButtonMaxY = scrollView.frame.origin.y + loginButton.frame.origin.y + loginButton.frame.height
        
        let yContentOverlap = loginButtonMaxY - keyboardOriginY
        let yContentOffset = yContentOverlap > -Constants.padding ? yContentOverlap + Constants.padding : 0
        
        scrollView.setContentOffset(
            .init(x: 0, y: yContentOffset),
            animated: true
        )
    }
    
}



extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        forceHideKeyboard()
        return true
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case loginTextField:
            login = textField.text!
        case passwordTextField:
            password = textField.text!
        default:
            return
        }
    }
    
}



private extension LogInViewController {
    
    struct Constants {
        static var padding: CGFloat = 16
        static var logoVerticalPadding: CGFloat = 120
        static var logoHeight: CGFloat = 100
        static var buttonHeight: CGFloat = 50
        static var loginFormHeight: CGFloat = 100
    }

}
