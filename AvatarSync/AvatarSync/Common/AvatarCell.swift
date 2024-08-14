//
//  AvatarCell.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    //MARK: -- Properties
    lazy var avatarImage: UIImageView = {
        return $0
    }(UIImageView())
    
    //MARK: -- Init methods
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configure Cell
private extension AvatarCell {
    func configureCell() {
        contentView.addSubviews(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
