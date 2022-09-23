//
//  CredentialsTextField.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/20/22.
//

import UIKit

class CredentialsTextField: RoundedTextField {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(isSecure: Bool) {
        self.init(frame: .zero)
        isSecureTextEntry = isSecure
    }
    
    private func configure() {
        autocapitalizationType = .none
        autocorrectionType = .no
    }

}
