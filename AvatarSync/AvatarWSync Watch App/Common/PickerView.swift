//
//  PickerView.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 14.08.24.
//

import SwiftUI

struct PickerView: View {
    let height: CGFloat = 100
    
    let title: String
    @Binding var selection: Int
    let values: [Int]
    
    var body: some View {
        VStack {
            Text(title)
            Picker("", selection: $selection) {
                ForEach(values, id: \.self) {
                    Text("\($0)")
                }
            }
            .frame(height: height)
            .pickerStyle(WheelPickerStyle())
        }
    }
}
