//
//  Constants.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 24/02/24.
//

struct Constants {
    struct Localizables {
        static let charactersTitle: String = "Characters"
        static let filterByTitle: String = "Filter by:"
        static let pickerTitle: String = "Please choose a filter"
        static let searchByTypeTitle: String = "Type # to get options"
        static let searchTitle: String = "Type to filter"
        static let aliveStatus: String = CharacterStatus.alive.rawValue
        static let deadStatus: String = CharacterStatus.dead.rawValue
        static let femaleGender: String = CharacterGender.female.rawValue
        static let maleGender: String = CharacterGender.female.rawValue
        static let gendeless: String = CharacterGender.genderless.rawValue
        static let unknown: String = CharacterGender.unknown.rawValue
        static let specieTitle: String = "Specie:"
        static let originTitle: String = "Origin:"
        static let genderTitle: String = "Gender:"
        static let statusTitle: String = "Status:"
        static let locationTitle: String = "Location:"
    }
    
    struct SizeModifiers {
        static let imageLength: Double = 50.0
        static let imageHeight: Double = 300.0
        static let leadingSpacing: Double = 20.0
        static let padding: Double = 10.0
        static let lineWidth: Double = 1.0
        static let radius: Double = 5.0
        static let imageRadius: Double = 2.0
    }
}
