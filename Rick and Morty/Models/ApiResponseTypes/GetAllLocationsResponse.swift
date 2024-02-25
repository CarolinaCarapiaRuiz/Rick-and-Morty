//
//  GetAllLocationsResponse.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 23/02/24.
//

import Foundation

struct GetAllLocationsResponse: Codable {
    let info: Info
    let results: [Location]
}
