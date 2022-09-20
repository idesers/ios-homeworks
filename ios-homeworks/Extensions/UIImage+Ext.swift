//
//  UIImage+Ext.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/20/22.
//

import UIKit

extension UIImage {
    
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(at: .zero, blendMode: .normal, alpha: alpha)
        }
    }
    
}
