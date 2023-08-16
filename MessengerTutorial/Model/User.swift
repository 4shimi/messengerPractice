//
//  User.swift
//  MessengerTutorial
//
//  Created by 정회승 on 2023/08/14.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User{
    static let MOCK_USER = User(fullname: "Bruce Wanyne", email: "batman@gmail.com", profileImageUrl: "batman")
}
