//
//  CharacterCreationView.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

protocol CharacterCreationViewProtocol: AnyObject {}

class CharacterCreationView: UIViewController, CharacterCreationViewProtocol {
    var presenter: CharacterCreationViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
}

