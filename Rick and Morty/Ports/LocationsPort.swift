//
//  LocationsPort.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 25/02/24.
//

import Foundation

protocol LocationsPort: ObservableObject {
    var locations: [Location] { get set }
    var serviceError: ServiceError? { get set }
    func getLocations() async
}
