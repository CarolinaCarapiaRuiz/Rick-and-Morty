//
//  Location.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
