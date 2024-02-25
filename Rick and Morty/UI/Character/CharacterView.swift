//
//  CharacterView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI
import SwiftData

struct CharacterView<T>: View where T: CharacterViewModelProtocol {
    @ObservedObject private var characterViewModel: T
    @State private var searchCharacter: String
    @State private var filterOption: FilterOption
    @State private var searchIsActive = false
    
    private var suggestedTokens: [Token] {
        if searchCharacter.starts(with: "#") {
            switch filterOption {
            case .status:
                return [Token(name: Constants.Localizables.aliveStatus), Token(name: Constants.Localizables.deadStatus)]
            case .gender:
                return [Token(name: Constants.Localizables.femaleGender), Token(name: Constants.Localizables.maleGender), Token(name: Constants.Localizables.gendeless), Token(name: Constants.Localizables.unknown)]
            default:
                return []
            }
        } else {
            return []
        }
    }
    
    @State private var currentToken = [Token]()
    
    private var filteredCharacters: [Characters] {
        let trimmedSearchText = searchCharacter.trimmingCharacters(in: .whitespaces)
        if !trimmedSearchText.isEmpty || !currentToken.isEmpty {
            if !trimmedSearchText.isEmpty {
                characterViewModel.filteredList(option: filterOption, filteredKey: trimmedSearchText )
            }
            
            if !currentToken.isEmpty {
                characterViewModel.filteredList(option: filterOption, filteredKey: currentToken.map{String($0.name)}.joined(separator: ","))
            }
        }
        
        return characterViewModel.characters
    }
    
    var body: some View {
        NavigationStack {
            List(filteredCharacters, id: \.id) { character in
                NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character)))
                {
                    CharacterViewCell(character: character)
                }
            }
            .navigationTitle(Constants.Localizables.charactersTitle)
            .task {
                await characterViewModel.getCharacters()
            }
            .toolbar {
                HStack {
                    Text(Constants.Localizables.filterByTitle)
                    Picker(Constants.Localizables.pickerTitle, selection: $filterOption) {
                        ForEach(FilterOption.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                        }
                    }
                }
                
            }
            .searchable(text: $searchCharacter, tokens: $currentToken, suggestedTokens: .constant(suggestedTokens), prompt: Text(getPrompt())) { status in
                Text(status.name)
            }
        }
        
    }
    
    func getPrompt() -> String {
        if filterOption == .gender || filterOption == .status {
            return Constants.Localizables.searchByTypeTitle
        }
        return Constants.Localizables.searchTitle
    }
    
    init(viewModel: T) {
        self.characterViewModel = viewModel
        self.searchCharacter = ""
        self.filterOption = .name
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        let service: Service = Service()
        let viewModel = CharacterViewModel(service: service)
        CharacterView(viewModel: viewModel)
    }
}
