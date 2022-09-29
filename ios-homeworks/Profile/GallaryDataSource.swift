//
//  GallaryDataSource.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/29/22.
//

import UIKit

class GallaryDataSource: NSObject {
    
    struct ViewModel {
        var isRounded: Bool = false
        var images: [UIImage?] = []
    }
    
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    override init() {
        self.viewModel = ViewModel()
    }
    
    func set(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
}

extension GallaryDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(with: viewModel.images[indexPath.item], isRounded: viewModel.isRounded)
        
        return cell
    }
}
