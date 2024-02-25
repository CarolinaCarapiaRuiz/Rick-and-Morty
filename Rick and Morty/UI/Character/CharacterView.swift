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
                return [Token(name: "Alive"), Token(name: "Dead")]
            case .gender:
                return [Token(name: "Female"), Token(name: "Male"), Token(name: "Genderless"), Token(name: "unknown")]
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
    
    struct Token: Identifiable {
        var id: String { name }
        var name: String
    }
    
    var body: some View {
        NavigationStack {
            List(filteredCharacters, id: \.id) { character in
                NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character)))
                {
                    CharacterViewCell(character: character)
                }
            }
            .navigationTitle("Characters")
            .task {
                await characterViewModel.getCharacters()
            }
            .toolbar {
                HStack {
                    Text("Filter by:")
                    Picker("Please choose a filter", selection: $filterOption) {
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
            return "Type # to get options"
        }
        return "Type to filter"
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
