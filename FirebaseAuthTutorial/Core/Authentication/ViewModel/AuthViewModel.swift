//
//  AuthViewModel.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/27/24.
//

import Foundation
import FirebaseAuth
import Firebase

// responsible for having all functionlity with authenticating the user, i.e. making the API calls
// sending info/updates to the Views
// handling erros when sing in


// observable object - our view is gonna be able to observe changes to AuthViewModel
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // gonna tell us whether we have a user logged in or not
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("sign in ...")
    }
    func createUser(withEmail email: String, password: String, fullName: String) async throws{
        print("Create user...")
    }
    func signOut(){
        print("sign out ...")
    }
    func deleteAccount(){
        print("detele account...")
    }
    func fetchUserData() async {
        print("fetch data")
    }
}

