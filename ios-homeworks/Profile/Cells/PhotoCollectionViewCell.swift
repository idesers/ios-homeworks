//
//  PhotoTableViewCell.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/24/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: self)
    
    private var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with image: UIImage?, isRounded: Bool = false) {
        photoImageView.image = image
        
        if isRounded {
            contentView.layer.cornerRadius = 6
            contentView.layer.masksToBounds = true
        }
    }
}

