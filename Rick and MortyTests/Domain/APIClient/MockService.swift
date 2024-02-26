//
//  MockService.swift
//  Rick and MortyTests
//
//  Created by Carolina Carapia on 25/02/24.
//

@testable import Rick_and_Morty
import Foundation
import XCTest

final class MockService: XCTestCase, ServicePortStub {
    var fileName: String?
    func execute<T>(_ request: RequestStub, expenting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        do {
            let data = try getData(fromJSON: fileName ?? "")
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(type.self, from: data)
            completion(.success(jsonData))
        } catch {
            completion(.failure(error))
        }
    }
}
