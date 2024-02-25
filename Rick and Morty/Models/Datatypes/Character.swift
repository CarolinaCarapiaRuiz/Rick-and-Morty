//
//  Character.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI

class Characters: Codable {
    let id: Int?
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let origin: Origin
    let location: SingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    init(id: Int?, name: String, status: CharacterStatus, species: String, type: String, gender: CharacterGender, origin: Origin, location: SingleLocation, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
