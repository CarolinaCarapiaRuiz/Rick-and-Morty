//
//  CharacterAdapter.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import Foundation

final class CharacterAdapter: CharacterPort {
    @Published var characters: [Characters]
    @Published var serviceError: ServiceError?
    private let service: ServicePort
    
    init(service: ServicePort) {
        self.characters = [Characters]()
        self.service = service
    }
    
    func getCharacters() async {
        service.execute(.listCharactersRequests, expenting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let results = model.results else { return }
                DispatchQueue.main.async {
                    self.characters = results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.serviceError = ServiceError.failedRequest(error: error)
                }
            }
        }
    }
    
    func filteredList(option: FilterOption, filteredKey: String) {
        let queryItems: [URLQueryItem] = [URLQueryItem(name: option.rawValue, value: filteredKey)]
        let request: Request = Request(endpoint: .character, queryParameters: queryItems)
        service.execute(request, expenting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let results = model.results else { return }
                DispatchQueue.main.async {
                    self.characters = results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.serviceError = ServiceError.failedRequest(error: error)
                }
            }
        }
    }
}
