//
//  UserModel.swift
//  Tinder
//
//  Created by Rodrigo Vart on 28/02/22.
//

import Foundation

struct UserResults: Decodable {
    let results: [User]
}

struct User: Decodable {
    var id: Int?
    var photo: String?
    let name: UserName
    let dob: UserAge
    var phrase: String?
    var match: Bool?
}

struct UserName: Decodable {
    let title: String
    let first: String
    let last: String
    var nameComplete: String {
        return String("\(first) \(last)")
    }
}

struct UserAge: Decodable {
    let date: String
    let age: Int
}
