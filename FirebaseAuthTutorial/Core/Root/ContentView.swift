//
//  ContentView.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        // if we have a user logged in, go to profile view
        // if not, go to login view
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
