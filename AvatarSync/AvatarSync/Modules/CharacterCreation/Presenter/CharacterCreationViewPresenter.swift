//
//  CharacterCreationViewPresenter.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import Foundation
protocol CharacterCreationViewPresenterProtocol {
    init(view: CharacterCreationViewProtocol, model: CharacterModelProtocol)
}

class CharacterCreationViewPresenter: CharacterCreationViewPresenterProtocol {
    
    weak var view: CharacterCreationViewProtocol?
    var model: CharacterModelProtocol
    
    required init(view: any CharacterCreationViewProtocol, model: any CharacterModelProtocol) {
        self.view = view
        self.model = model
    }
    
}

