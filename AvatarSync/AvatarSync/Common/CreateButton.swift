//
//  CreateButton.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class CreateButton: UIButton {
    //MARK: -- Properties
    var title: String?
    
    //MARK: -- Init methods
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
        heightAnchor.constraint(equalToConstant: Constants.CreateButtonConstants.height).isActive = true
        widthAnchor.constraint(equalToConstant: Constants.CreateButtonConstants.width).isActive = true
        layer.masksToBounds = true
        layer.cornerRadius = Constants.CreateButtonConstants.cornerRadius
        setTitleColor(.black, for: .normal)
        titleLabel?.font = Constants.CreateButtonConstants.titleFont
        backgroundColor = Constants.CreateButtonConstants.backgroundColor
        setTitle(title, for: .normal)
        setTitleColor(Constants.CreateButtonConstants.textColor, for: .normal)
    }
}
