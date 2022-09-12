//
//  ProfileHeaderView.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/12/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var status: String!
    private let padding: CGFloat = 16
    
    private let avatarImageView = UIImageView()
    private let labelsStackView = UIStackView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let setStatusButton = UIButton(configuration: .filled())
    private let statusTextField = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    
    private func configure() {
        configureAvatarImageView()
        configureLabels()
        configureLabelsStackView()
        configureStatusTextField()
        configureSetStatusButton()
    }
    
    
    private func configureAvatarImageView() {
        self.addSubview(avatarImageView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = Resources.Images.cat
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
        ])
    }
    
    
    private func configureLabels() {
        nameLabel.font = Resources.Fonts.title
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.text = "Meow Meow"
        
        statusLabel.font = Resources.Fonts.body
        statusLabel.textAlignment = .left
        statusLabel.textColor = .gray
        statusLabel.text = "Status"
    }
    
    
    private func configureLabelsStackView() {
        self.addSubview(labelsStackView)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .vertical
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(statusLabel)

        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            labelsStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            labelsStackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -padding)
        ])
    }
    
    
    private func configureStatusTextField() {
        self.addSubview(statusTextField)
        
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
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: padding / 2),
            statusTextField.leadingAnchor.constraint(equalTo: labelsStackView.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: labelsStackView.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func configureSetStatusButton() {
        self.addSubview(setStatusButton)
        
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
        
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: padding / 2),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
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
