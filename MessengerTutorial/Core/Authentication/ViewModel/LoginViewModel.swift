//
//  LoginViewMoel.swift
//  MessengerTutorial
//
//  Created by 정회승 on 2023/08/16.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
