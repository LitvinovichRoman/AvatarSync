//
//  ContentView.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 13.08.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: WatchDataModel

    var body: some View {
        NavigationView {
            ZStack {
                Image(.watchBg)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        if let avatar = model.avatar {
                            Image(uiImage: avatar)
                                .resizable()
                                .frame(width: Constants.ContentViewConstants.width,
                                       height: Constants.ContentViewConstants.height)
                                
                                .padding()
                        } else {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: Constants.ContentViewConstants.width,
                                       height: Constants.ContentViewConstants.height)
                                .cornerRadius(Constants.ContentViewConstants.cornerRadius)
                                .padding()
                        }
                        
                        Text("Age: \(model.age)")
                        Text("Height: \(model.height) cm")
                        Text("Weight: \(model.weight) kg")
                        
                        NavigationLink(destination: EditView(selectedAge: $model.age,
                                                             selectedHeight: $model.height,
                                                             selectedWeight: $model.weight)) {
                            
                            Text(Constants.ContentViewConstants.editTitleTExt)
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(Constants.ContentViewConstants.textCornerRadius)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
