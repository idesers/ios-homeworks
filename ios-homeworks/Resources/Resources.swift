//
//  Resources.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/29/22.
//

import UIKit

struct Resources {
    struct Icons {
        static let house = UIImage(systemName: "house")!
        static let person = UIImage(systemName: "person")!
        static let infoCircle = UIImage(systemName: "info.circle")
    }
    
    struct Images {
        static let catAvatar = UIImage(named: "CatAvatar")
        static let logo = UIImage(named: "Logo")
    }
    
    struct Fonts {
        static let title = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let body = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    struct Colors {
        static let accent = UIColor(named: "AccentColor")
    }
}

