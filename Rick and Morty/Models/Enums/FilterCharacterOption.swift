//
//  FilterCharacterOption.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 23/02/24.
//

enum FilterCharacterOption {
    case name(filteredKey: String)
    case status(filteredKey: String)
    case gender(filteredKey: String)
    case species(filteredKey: String)
    case type(filteredKey: String)
}

enum FilterOption: String, CaseIterable {
    case name = "name"
    case status = "status"
    case gender = "gender"
    case species = "species"
    case type = "type"
}
