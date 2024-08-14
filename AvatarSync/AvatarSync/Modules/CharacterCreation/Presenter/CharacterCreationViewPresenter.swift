//
//  CharacterCreationViewPresenter.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit
import WatchConnectivity

protocol CharacterCreationViewPresenterProtocol: AnyObject {
    func createCharacter(avatar: UIImage, age: Int, height: Int, weight: Int)
    func avatarSelected(_ avatar: UIImage)
}

class CharacterCreationViewPresenter: CharacterCreationViewPresenterProtocol {
    private weak var view: CharacterCreationViewProtocol?
    private var model: CharacterModelProtocol
    private var selectedAvatar: UIImage?
    
    init(view: CharacterCreationViewProtocol, model: CharacterModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func avatarSelected(_ avatar: UIImage) {
        selectedAvatar = avatar
    }
    
    func createCharacter(avatar: UIImage, age: Int, height: Int, weight: Int) {
        guard let selectedAvatar = selectedAvatar else {
            view?.showError(message: Constants.CharacterCreationViewConstants.errorAlertMessage)
            return
        }
        
        model.createCharacter(avatar: selectedAvatar, age: age, height: height, weight: weight)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            if session.activationState == .activated {
                let avatarData = selectedAvatar.pngData() 
                let dictionary: [String: Any] = [
                    "avatarData": avatarData ?? Data(),
                    "age": age,
                    "height": height,
                    "weight": weight,
                ]
                
                do { try session.updateApplicationContext(dictionary) }
                catch { print("Error: \(error)") }
                
            } else { print("WCSession is not activated") }
        }
        view?.showSuccess()
    }

}
