//
//  CharacterModel.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

protocol CharacterModelProtocol {
    var avatar: UIImage? { get set }
    var age: Int? { get set }
    var height: Int? { get set }
    var weight: Int? { get set }
    var avatars: [UIImage] { get set }
    func createCharacter(avatar: UIImage, age: Int, height: Int, weight: Int) -> Void
}

class CharacterModel: CharacterModelProtocol {
    var avatar: UIImage?
    var age: Int?
    var height: Int?
    var weight: Int?
    var avatars: [UIImage] = [
        Resources.Images.Avatars.firstAvatar,
        Resources.Images.Avatars.secondAvatar,
        Resources.Images.Avatars.thirdAvatar,
        Resources.Images.Avatars.fourAvatar,
        Resources.Images.Avatars.fifthAvatar,
        Resources.Images.Avatars.sixthAvatar,
    ]
    
    func createCharacter(avatar: UIImage, age: Int, height: Int, weight: Int) {
        self.avatar = avatar
        self.age = age
        self.height = height
        self.weight = weight
    }
}
