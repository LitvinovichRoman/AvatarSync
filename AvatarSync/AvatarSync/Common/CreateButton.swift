//
//  CreateButton.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class CreateButton: UIButton {
    let height: CGFloat = 44
    let width: CGFloat = 150
    var title: String?
    
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configure Button
private extension CreateButton {
    func configureButton() {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        layer.masksToBounds = true
        layer.cornerRadius = 22
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        backgroundColor = .systemGray5.withAlphaComponent(0.3)
        setTitle(title, for: .normal)
    }
}
