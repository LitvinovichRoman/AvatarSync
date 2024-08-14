//
//  TitleLabel.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class TitleLabel: UILabel {
    //MARK: -- Init methods
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = .center
        self.textColor = Constants.TitleLabelConstants.textColor
        self.font = Constants.TitleLabelConstants.font
        self.backgroundColor = Constants.TitleLabelConstants.backgroundColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = Constants.TitleLabelConstants.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
