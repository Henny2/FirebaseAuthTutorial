//
//  AuthViewModel.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/27/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

// responsible for having all functionlity with authenticating the user, i.e. making the API calls
// sending info/updates to the Views
// handling erros when sing in

@MainActor // publihsing updates for @Published needs to happen on main thread, that is why we are setting this
// observable object - our view is gonna be able to observe changes to AuthViewModel
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // gonna tell us whether we have a user logged in or not
    @Published var currentUser: User?
    
    init() {
        // functionality we get from firebase, they cache who is logged in on the device, we don't have to specifically save that
        self.userSession = Auth.auth().currentUser
        
        // trying to fetch user data right away
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("sign in ...")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            // uploading data to firestore database
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser() // fetching the data we just uploaded
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        // back to login screen
        //sign out on backend
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.currentUser = nil // wipes out current user data model
            self.userSession = nil // wipes out user session and takes us back to login screen
        } catch {
            print("Failed to singout with error \(error.localizedDescription)")
        }
        print("sign out ...")
    }
    func deleteAccount(){
        print("detele account...")
    }
    
    
    func fetchUser() async {
        guard let uid =  Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }// using try? to not have to handle the error, but we could do a do catch block
        let user = try? snapshot.data(as: User.self)
        self.currentUser = user // setting current user to be the user
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
}

