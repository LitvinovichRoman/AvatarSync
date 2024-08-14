//
//  AvatarWSyncApp.swift
//  AvatarWSync Watch App
//
//  Created by Roman Litvinovich on 13.08.24.
//

import SwiftUI
import WatchConnectivity

@main
struct AvatarWSync_Watch_App: App {
    @StateObject private var model = WatchDataModel()

    init() {
        setupWCSession()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
    
    private func setupWCSession() {
        guard WCSession.isSupported() else {
            print("WCSession is not supported on this device.")
            return
        }
        
        let session = WCSession.default
        session.delegate = WCSessionDelegateImplementation.shared
        session.activate()
    }
}
