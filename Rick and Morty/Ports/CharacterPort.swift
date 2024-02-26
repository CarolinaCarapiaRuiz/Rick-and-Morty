//
//  CharacterPort.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 25/02/24.
//

import Foundation

protocol CharacterPort: ObservableObject {
    var characters: [Characters] { get set }
    func getCharacters() async
    func filteredList(option: FilterOption, filteredKey: String)
}
