//
//  UserGenerator.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import Foundation

struct UserGenerator {
    static func create() -> User {
        return User(uuid: UUID(),
             name: "Doe",
             firstName: "John",
             cards: [
                Card(owner: "Canopée", id: UUID(), logo: "logo1.jpg"),
                Card(owner: "Les Brasseurs", id: UUID(), logo: "logo2.jpg")
             ])
    }
}
