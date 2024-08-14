//
//  UIView.ext.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        views.forEach(addSubview(_:))
        
    }
}
