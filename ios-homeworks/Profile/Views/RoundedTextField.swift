//
//  RoundedTextField.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/20/22.
//

import UIKit

class RoundedTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .black
        backgroundColor = .systemGray6
        font = .systemFont(ofSize: 16, weight: .regular)
        tintColor = Resources.Colors.accent
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        
        leftViewMode = .always
        rightViewMode = .always
        leftView = UIView(frame: .init(x: 0, y: 0, width: 16, height: 0))
        rightView = UIView(frame: .init(x: 0, y: 0, width: 16, height: 0))
    }

}
