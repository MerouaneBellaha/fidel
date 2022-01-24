//
//  Card.swift
//  Fidel
//
//  Created by Merouane Bellaha on 24/01/2022.
//

import Foundation

struct Card: Identifiable {
    let owner: String
    let id: UUID
    let numberOfStamps = 5
    let logo: String
    let reward: String = "un menu offert !"
    let limit = 10
}
