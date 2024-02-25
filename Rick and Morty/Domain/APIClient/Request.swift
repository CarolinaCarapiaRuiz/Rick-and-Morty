//
//  Request.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import Foundation

final class Request {
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    let endpoint: Endpoint
    let pathComponents: [String]
    let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    public let httpMethod: String = "GET"
    
    init(
        endpoint: Endpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension Request {
    static let listCharactersRequests = Request(endpoint: .character)
    static let listLocationsRequests = Request(endpoint: .location)
}
