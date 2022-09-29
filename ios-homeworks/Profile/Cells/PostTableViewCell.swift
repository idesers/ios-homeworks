//
//  PostTableViewCell.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/21/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"

    struct ViewModel {
        let author: String
        let image: UIImage?
        let description: String
        let likes: Int
        let views: Int
    }
    
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        makeConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with viewModel: ViewModel) {
        authorLabel.text = viewModel.author
        descriptionLabel.text = viewModel.description
        likesCountLabel.text = "Likes: \(viewModel.likes)"
        viewsCountLabel.text = "Views: \(viewModel.views)"
        photoImageView.image = viewModel.image
    }
    
    
    private func addSubviews() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(photoImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(likesCountLabel)
        stackView.addArrangedSubview(viewsCountLabel)
    }
    
    
    private func makeConstraints() {
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            photoImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: padding),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }

}
