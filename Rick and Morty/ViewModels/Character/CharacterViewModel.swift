//
//  CharacterViewModel.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import Foundation

protocol CharacterViewModelProtocol: ObservableObject {
    var characters: [Characters] { get set }
    func getCharacters() async
    func filteredList(option: FilterOption, filteredKey: String)
}

final class CharacterViewModel: CharacterViewModelProtocol {
    @Published var characters: [Characters]
    private let service: Service
    
    init(service: Service) {
        self.characters = [Characters]()
        self.service = service
    }
    
    func getCharacters() async {
        service.execute(.listCharactersRequests, expenting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                guard let results = model.results else { return }
                DispatchQueue.main.async {
                    self.characters = results
                }
            case .failure(let error):
                print(error)
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
                print(model)
                guard let results = model.results else { return }
                DispatchQueue.main.async {
                    self.characters = results
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
