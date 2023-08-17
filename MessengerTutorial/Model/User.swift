//
//  User.swift
//  MessengerTutorial
//
//  Created by 정회승 on 2023/08/14.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
}

extension User{
    static let MOCK_USER = User(fullname: "Bruce Wanyne", email: "batman@gmail.com", profileImageUrl: "batman")
}
