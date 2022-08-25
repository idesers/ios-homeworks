//
//  UIView+Ext.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 8/25/22.
//

import UIKit

extension UIView {
    static func loadFromNib<T>() -> T {
        UINib(nibName: "\(self)", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as! T
    }
}
