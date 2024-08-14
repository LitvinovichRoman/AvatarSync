//
//  WatchDataModel.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 14.08.24.
//

import SwiftUI

class WatchDataModel: ObservableObject {
    @Published var avatar: UIImage? = nil
    @Published var age: Int = .zero
    @Published var height: Int = .zero
    @Published var weight: Int = .zero
    
    init() {
        NotificationCenter.default.addObserver(self,  selector: #selector(updateFromNotification),
                                               name: NSNotification.Name(rawValue: "dataNotification"), object: nil)
    }
    
    @objc private func updateFromNotification() {
        avatar = DataManger.avatar
        age = DataManger.age
        height = DataManger.height
        weight = DataManger.weight
    }
}
