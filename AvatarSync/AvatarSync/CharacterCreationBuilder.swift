//
//  CharacterCreationBuilder.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class CharacterCreationBuilder {
    static func getCharacterCreationView() -> UIViewController {
        let model = CharacterModel()
        let view = CharacterCreationView()
        view.model = model
        let presenter = CharacterCreationViewPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}

