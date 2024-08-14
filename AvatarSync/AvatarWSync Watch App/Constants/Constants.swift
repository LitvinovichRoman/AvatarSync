//
//  Constants.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 14.08.24.
//

import Foundation
import SwiftUI

struct Constants {
    
   //MARK: -- ContentViewConstants
    enum ContentViewConstants {
        static let width: CGFloat = 100
        static let height: CGFloat = 100
        static let cornerRadius: CGFloat = 16
        static let textCornerRadius: CGFloat = 8
        static let editTitleTExt: String = "Edit"
    }
    
    //MARK: -- EditViewConstants
    enum EditViewConstants {
        static let agesRange: ClosedRange = (0...100)
        static let heightsRange: ClosedRange = (0...300)
        static let weightsRange: ClosedRange = (0...300)
        
        static let agePickerTitle: String = "Age"
        static let heightPickerTitle: String = "Cm"
        static let weightPickerTitle: String = "Kg"
        static let buttonTitle: String = "Save"
        
        static let buttonCornerRadius: CGFloat = 8
    }
    
}
