//
//  WCSessionDelegateImplementation.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 14.08.24.
//

import WatchConnectivity
import WatchKit
import UIKit

class WCSessionDelegateImplementation: NSObject, WCSessionDelegate {
    
    
    static let shared = WCSessionDelegateImplementation()
    
    private override init() {
        super.init()
        setupWatchConnectivity()
    }
    
    func setupWatchConnectivity() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let avatarData = applicationContext["avatarData"] as? Data,
           let avatar = UIImage(data: avatarData) {
            DataManger.avatar = avatar
        } else {
            print("Failed to convert avatar data to UIImage or avatar data is nil")
        }
        
        let age = applicationContext["age"] as? Int ?? 0
        let height = applicationContext["height"] as? Int ?? 0
        let weight = applicationContext["weight"] as? Int ?? 0

        DataManger.age = age
        DataManger.height = height
        DataManger.weight = weight
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("dataNotification"), object: nil)
        }
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("Received user info: \(userInfo)")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error = error {
            fatalError("Can't activate session with error: \(error.localizedDescription)")
        }
        print("WC Session activated with state: \(activationState.rawValue)")
    }
    
}
    
   
