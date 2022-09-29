//
//  ProfileHeaderView.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/12/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: Properties
    
    private var status: String!
    private let padding: CGFloat = 16
    
    // MARK: Properties - Subviews
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = Resources.Images.catAvatar
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.masksToBounds = true
        return avatarImageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let labelsStackView = UIStackView()
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .vertical
        labelsStackView.spacing = padding
        return labelsStackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = Resources.Fonts.title
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.text = "Meow Meow"
        return nameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = Resources.Fonts.body
        statusLabel.textAlignment = .left
        statusLabel.textColor = .gray
        statusLabel.text = "Status"
        return statusLabel
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(configuration: .filled())
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.tintColor = .systemBlue
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.setTitle("Set Status", for: .normal)
        setStatusButton.isEnabled = false
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset = .init(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        return setStatusButton
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.placeholder = "Enter new status"
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.leftViewMode = .always
        statusTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: padding, height: 0))
        return statusTextField
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubviews()
        makeConstraints()
        setupTargets()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    // MARK: Confuguration
    
    private func addSubviews() {
        self.addSubview(avatarImageView)
        self.addSubview(labelsStackView)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(statusLabel)
    }
    
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),

            labelsStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: padding),
            labelsStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
 
            statusTextField.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: padding),
            statusTextField.leadingAnchor.constraint(equalTo: labelsStackView.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: labelsStackView.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: padding),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    private func setupTargets() {
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
}

// MARK: Actions
private extension ProfileHeaderView {
    
    @objc private func buttonPressed() {
        statusTextField.text = nil
        setStatusButton.isEnabled = false
        statusLabel.text = status
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        status = textField.text
        setStatusButton.isEnabled = !textField.text!.isEmpty
    }
}
