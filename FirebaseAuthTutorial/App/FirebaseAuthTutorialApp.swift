//
//  FirebaseAuthTutorialApp.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/13/24.
//

import SwiftUI

@main
struct FirebaseAuthTutorialApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) //only initialized once, available everywhere
        }
    }
}
