//
//  Model.swift
//  "Hello" app
//
//  Created by Варвара Фомина on 31.10.2021.
//

import Foundation

struct User {
    let nameUser: String
    let passwordUser: String
    let fullName: String
    
}

extension User {
    static func getUser() -> User{
        return User(nameUser: "Varvara", passwordUser: "VarvaraG", fullName: "Varvara")
    }
    
}
