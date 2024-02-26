//
//  Service.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import Foundation

final class Service: ServicePort {
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    func execute<T: Codable>(_ request: Request, expenting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request)
        else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            guard let data = data, error == nil
            else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from request: Request) -> URLRequest? {
        guard let url = request.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        return urlRequest
    }
}
