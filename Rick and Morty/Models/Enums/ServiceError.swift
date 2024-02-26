//
//  ServiceError.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 26/02/24.
//

enum ServiceError: Error {
    case failedToCreateRequest
    case failedToGetData
    case failedRequest(error: Error)
    
    var description: String {
        switch self {
        case .failedToCreateRequest, .failedToGetData:
            return "Sorry, we're having trouble getting your information."
        case .failedRequest(error: _):
            return "Failed to connect to server."
        }
    }
}
