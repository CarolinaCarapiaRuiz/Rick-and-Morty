//
//  CharacterDetailViewModel.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import Foundation

final class CharacterDetailViewModel: ObservableObject {
    @Published var character: Characters
    init(character: Characters) {
        self.character = character
    }
}
