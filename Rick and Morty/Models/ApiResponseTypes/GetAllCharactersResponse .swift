//
//  GetAllCharactersResponse .swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    let info: Info
    let results: [Characters]?
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

