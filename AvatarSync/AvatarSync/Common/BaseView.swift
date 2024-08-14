//
//  BaseView.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class BaseView: UIViewController {
    lazy var contentView: UIImageView = {
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
}

//MARK: - Configure layout
extension BaseView {
    func configureBackground(with image: UIImage) {
        view.addSubviews(contentView)
        contentView.image = image
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
