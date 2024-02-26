//
//  ServicePortStub.swift
//  Rick and MortyTests
//
//  Created by Carolina Carapia on 25/02/24.
//

protocol ServicePortStub {
    func execute<T: Codable>(_ request: RequestStub, expenting type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
