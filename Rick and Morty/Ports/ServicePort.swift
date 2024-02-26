//
//  ServicePort.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 25/02/24.
//

protocol ServicePort {
    func execute<T: Codable>(_ request: Request, expenting type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
