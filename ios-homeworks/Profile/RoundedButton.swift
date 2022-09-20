//
//  RoundedButton.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/20/22.
//

import UIKit

class RoundedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, backgroundImage: UIImage?) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
        
        if let backgroundImage = backgroundImage {
            setBackgroundImage(backgroundImage, for: .normal)
            setBackgroundImage(backgroundImage.withAlpha(0.8), for: .disabled)
            setBackgroundImage(backgroundImage.withAlpha(0.8), for: .highlighted)
            setBackgroundImage(backgroundImage.withAlpha(0.8), for: .selected)
        }
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
