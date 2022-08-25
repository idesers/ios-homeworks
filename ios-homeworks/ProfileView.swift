//
//  ProfileView.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/25/22.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    static func createView() -> ProfileView {
        let view: ProfileView = loadFromNib()
        return view
    }

}
