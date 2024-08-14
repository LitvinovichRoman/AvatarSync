//
//  Constants.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 14.08.24.
//

import UIKit

struct Constants {
    //MARK: -- ResizableLayoutConstants
    enum ResizableLayoutConstants {
        static let activeDistance: CGFloat = 200
        static let zoomFactor: CGFloat = 0.3
        static let lineSpacing: CGFloat = 40
        static let itemSize: CGSize = CGSize(width: 200, height: 200)
    }
    
    //MARK: -- PickerViewWithLabelConstants
    enum PickerViewConstants {
        static let labelfont: UIFont = .systemFont(ofSize: 18, weight: .semibold)
        static let labelBackgroundColor: UIColor = .systemGray5.withAlphaComponent(0.3)
        static let textColor: UIColor = .black

        
        static let cornerRadius: CGFloat = 12
        static let labelHeight: CGFloat =  30
        static let pickerTop: CGFloat = 8
    }
    
    //MARK: -- TitleLabelConstants
    enum TitleLabelConstants {
        static let font: UIFont = .systemFont(ofSize: 28, weight: .bold)
        static let backgroundColor: UIColor = .systemGray5.withAlphaComponent(0.3)
        static let cornerRadius: CGFloat = 12
        static let textColor: UIColor = .black
    }
    
    //MARK: -- CreateButtonConstants
    enum CreateButtonConstants {
        static let height: CGFloat = 44
        static let width: CGFloat = 150
        static let cornerRadius: CGFloat = 22
        static let titleFont: UIFont = .systemFont(ofSize: 18, weight: .semibold)
        static let backgroundColor: UIColor = .systemGray5.withAlphaComponent(0.3)
        static let textColor: UIColor = .black
    }
    
    //MARK: -- CharacterCreationViewConstants
    enum CharacterCreationViewConstants {
        static let collectionBackgroundColor: UIColor = .clear
        static let reuseIdentifier: String = "AvatarCell"
        
        static let selectCharacterLabelText: String = "Select a character!"
        static let setParametersLabelText: String = "Set parameters!"
        static let agePickerViewTitle: String = "Age"
        static let heightPickerViewTitle: String = "Height"
        static let weightPickerViewTitle: String = "Weight"
        static let createButtonTitle: String = "Create"
        
        static let alertTitle: String = "Success"
        static let alertMessage: String = "Character created successfully!"
        static let errorAlertMessage: String = "Character created successfully!"
        static let alertActionTitle: String = "Ok"
        static let errorAlertTitle: String = "Error"
        
        static let stackViewSpacing: CGFloat = 10
        static let stackViewHeight: CGFloat = 200
        static let collectionViewHeight: CGFloat = 320
        
        static let createButtonTop: CGFloat = 30
        static let topAnchor: CGFloat = 20
        static let leadingAnchor: CGFloat = 20
        static let trailingAnchor: CGFloat = -20
    }

}
