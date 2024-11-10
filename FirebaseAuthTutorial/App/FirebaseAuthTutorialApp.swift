//
//  FirebaseAuthTutorialApp.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/13/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseAuthTutorialApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) //only initialized once, available everywhere
        }
    }
}
