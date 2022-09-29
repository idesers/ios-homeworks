//
//  PhotosViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/29/22.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var dataSource: GallaryDataSource
    
    private struct Constants {
        static let itemSpacing: CGFloat = 8
        static let padding: CGFloat = 8
        static let numberOfItemsPerScreenWidth: CGFloat = 3
        static let itemHeightToWidth: CGFloat = 1
    }
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.minimumLineSpacing = Constants.itemSpacing
        collectionLayout.minimumInteritemSpacing = Constants.itemSpacing
        collectionLayout.sectionInset = UIEdgeInsets(top: Constants.padding, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        return collectionLayout
    }()
    
    private lazy var galaryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.allowsSelection = false
        return collectionView
    }()
    
    convenience init(dataSource: GallaryDataSource) {
        self.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
        galaryCollectionView.dataSource = dataSource
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.dataSource = GallaryDataSource()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Galary"
        view.addSubview(galaryCollectionView)
        
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            galaryCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            galaryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galaryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galaryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let spacing = collectionViewLayout.minimumLineSpacing * (Constants.numberOfItemsPerScreenWidth - 1)
        let insets = collectionViewLayout.sectionInset.left + collectionViewLayout.sectionInset.right
        let avaliableWidth = collectionView.frame.width - insets - spacing

        let itemWidth = avaliableWidth / Constants.numberOfItemsPerScreenWidth
        let itemHeight = itemWidth * Constants.itemHeightToWidth

        return CGSize(width: itemWidth, height: itemHeight)
    }
}
