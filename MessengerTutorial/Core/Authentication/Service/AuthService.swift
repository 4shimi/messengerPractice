//
//  AuthService.swift
//  MessengerTutorial
//
//  Created by 정회승 on 2023/08/16.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { try await UserService.shared.fetchCurrentUser()}
        print("DEBUG: User session id is \(userSession?.uid)")
    }
    
    @MainActor
    func login(withEmail email:String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to sign in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email:String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //user data 업로드
           try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
//            print("DEBUG: Create user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut() //sign out on backend
            self.userSession = nil //updates routing logic
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
