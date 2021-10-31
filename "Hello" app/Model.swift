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
    let applicationUser: String
    let aboutMe: AboutMe
    
}


struct AboutMe {
    let hobby: String
    let resume: String
}

extension AboutMe {
    static func getAboutMe() -> AboutMe{
        return AboutMe(
            hobby: "Мне 29 лет. Недавно я вышла замуж. У меня есть кот - Сиро. Я начала изучать SWIFT и мне очень нравится.",
            resume: "Я очень люблю природу, растения и путешествия.")
    }
}

extension User {
    static func getUser() -> User{
        return User(
            nameUser: "Varvara",
            passwordUser: "VarvaraG",
            applicationUser: "Varvara",
            aboutMe: AboutMe.getAboutMe())
    }
    
}


