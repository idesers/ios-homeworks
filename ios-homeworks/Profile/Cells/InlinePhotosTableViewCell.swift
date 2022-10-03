//
//  PhotosTableViewCell.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/24/22.
//

import UIKit

class InlinePhotosTableViewCell: UITableViewCell {
    
    static let identifier = "InlinePhotosTableViewCell"
    
    private var dataSource: GallaryDataSource = GallaryDataSource()
    
    private struct Constants {
        static let padding: CGFloat = 12
        static let itemSpacing: CGFloat = 8
        static let numberOfItemsPerScreenWidth: Int = 4
        static let itemHeightToWidth: CGFloat = 0.7
        
        static var itemSize: CGSize {
            let spacing = Constants.itemSpacing * CGFloat(Constants.numberOfItemsPerScreenWidth - 1)
            let insets = Constants.padding * 2
            let avaliableWidth = UIScreen.main.bounds.width - insets - spacing
            let itemWidth = avaliableWidth / CGFloat(Constants.numberOfItemsPerScreenWidth)
            let itemHeight = itemWidth * Constants.itemHeightToWidth
            return CGSize(width: itemWidth, height: itemHeight)
        }
        
        static var collectionViewHeight: CGFloat {
            let offset: CGFloat = 2
            return Constants.itemSize.height + Constants.padding * 2 + offset
        }
    }
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Icons.arrowRight
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = Constants.itemSpacing
        collectionLayout.minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        collectionLayout.sectionInset = UIEdgeInsets(top: Constants.padding, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        collectionLayout.itemSize = Constants.itemSize
        return collectionLayout
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.allowsSelection = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(dataSource: GallaryDataSource) {
        self.dataSource = dataSource
        self.photosCollectionView.dataSource = dataSource
    }
    
    private func addSubviews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photosCollectionView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            photosLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -Constants.padding),
            
            arrowImageView.topAnchor.constraint(equalTo: photosLabel.topAnchor),
            arrowImageView.bottomAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            
            photosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosCollectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight),
        ])
    }
    
}

