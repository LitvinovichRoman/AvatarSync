//
//  EditView.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 13.08.24.
//

import SwiftUI

struct EditView: View {
    @Binding var selectedAge: Int
    @Binding var selectedHeight: Int
    @Binding var selectedWeight: Int
    
    let ages = Array(Constants.EditViewConstants.agesRange)
    let heights = Array(Constants.EditViewConstants.heightsRange)
    let weights = Array(Constants.EditViewConstants.weightsRange)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image(.watchBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    HStack {
                        PickerView(title: Constants.EditViewConstants.agePickerTitle, selection: $selectedAge, values: ages)
                        PickerView(title: Constants.EditViewConstants.heightPickerTitle, selection: $selectedHeight, values: heights)
                        PickerView(title: Constants.EditViewConstants.weightPickerTitle, selection: $selectedWeight, values: weights)
                    }
                    .padding()
                    
                    Button(action: saveChanges) {
                        Text(Constants.EditViewConstants.buttonTitle)
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(Constants.EditViewConstants.buttonCornerRadius)
                    }
                }
                .padding()
            }
        }
    }
    
    private func saveChanges() {
        presentationMode.wrappedValue.dismiss()
    }
}
