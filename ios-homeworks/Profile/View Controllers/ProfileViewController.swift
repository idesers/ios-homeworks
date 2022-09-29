//
//  ProfileViewController.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var galaryStorage = MockModel.photos
    private var feedStorage = MockModel.posts
    
    private enum Sections: Int, CaseIterable {
        case inlineGalary
        case feed
    }
    
    private lazy var postsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(InlinePhotosTableViewCell.self, forCellReuseIdentifier: InlinePhotosTableViewCell.identifier)
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemGroupedBackground
        
        addSubviews()
        makeConstraints()
    }
    
    
    private func addSubviews() {
        view.addSubview(postsTableView)
    }
    
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}



extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.allCases[section] {
        case .feed:
            return feedStorage.count
        case .inlineGalary:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Sections.inlineGalary.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InlinePhotosTableViewCell.identifier, for: indexPath) as? InlinePhotosTableViewCell else {
                return UITableViewCell()
            }

            let images = galaryStorage.map { UIImage(named: $0.image) }
            let viewModel = GallaryDataSource.ViewModel(isRounded: true, images: images)
            let dataSource = GallaryDataSource(viewModel: viewModel)

            cell.set(dataSource: dataSource)

            return cell

        case Sections.feed.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }

            let post = feedStorage[indexPath.row]
            let viewModel = PostTableViewCell.ViewModel(
                author: post.author,
                image: UIImage(named: post.image),
                description: post.description,
                likes: post.likes,
                views: post.views
            )

            cell.setup(with: viewModel)
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return Sections.allCases[section] == .inlineGalary ? ProfileHeaderView() : nil
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Sections.inlineGalary.rawValue {
            let images = galaryStorage.map { UIImage(named: $0.image) }
            let viewModel = GallaryDataSource.ViewModel(isRounded: false, images: images)
            let dataSource = GallaryDataSource(viewModel: viewModel)
            let photosViewController = PhotosViewController(dataSource: dataSource)
            
            navigationController?.pushViewController(photosViewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
