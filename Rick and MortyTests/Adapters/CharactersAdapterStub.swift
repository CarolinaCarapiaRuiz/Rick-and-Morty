//
//  CharactersAdapterStub.swift
//  Rick and MortyTests
//
//  Created by Carolina Carapia on 25/02/24.
//
@testable import Rick_and_Morty
import XCTest
import Foundation

final class CharactersAdapterStub: CharacterPort {
    var serviceError: Rick_and_Morty.ServiceError?
    
    var characters: [Rick_and_Morty.Characters]
    private let service: MockService
    
    init(service: MockService) {
        self.service = service
        self.characters = []
    }
    
    func getCharacters() async {
        service.fileName = "AllCharacters"
        service.execute(.listCharactersRequests, expenting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let results = model.results else { return }
                DispatchQueue.main.async {
                    self.characters = results
                }
            case .failure(let error):
                XCTFail("Expected failure with error \(error), got \(result) instead")
            }
        }
    }
    
    func filteredList(option: Rick_and_Morty.FilterOption, filteredKey: String) {
        service.fileName = "AllCharacters"
        let queryItems: [URLQueryItem] = [URLQueryItem(name: option.rawValue, value: filteredKey)]
        let request: RequestStub = RequestStub(endpoint: .character, queryParameters: queryItems)
        service.execute(request, expenting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let results = model.results else { return }
                self.characters = results
            case .failure(let error):
                XCTFail("Expected failure with error \(error), got \(result) instead")
            }
        }
    }
    
    
}
