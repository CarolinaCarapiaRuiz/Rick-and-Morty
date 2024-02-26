//
//  CharactersAdapterTest.swift
//  Rick and MortyTests
//
//  Created by Carolina Carapia on 25/02/24.
//

import XCTest
@testable import Rick_and_Morty

final class CharactersAdapterTest: XCTestCase {
    
    func testGetAllCharacters() async {
        let adapter: any CharacterPort = CharactersAdapterStub(service: MockService())
        await adapter.getCharacters()
        XCTAssertNotNil(adapter.characters)
    }
    
    func testGetAllCharactersAdapter() async {
        let adapter: any CharacterPort = CharacterAdapter(service: Service())
        await adapter.getCharacters()
        XCTAssertNotNil(adapter.characters)
    }
    
    func testFilteredListByGender() async {
        let adapter = CharactersAdapterStub(service: MockService())
        adapter.filteredList(option: .gender, filteredKey: "Male")
        XCTAssertNotNil(adapter.characters)
        XCTAssertEqual(adapter.characters[0].gender.rawValue, "Male")
    }
    
    func testFilteredListByStatus() async {
        let adapter = CharactersAdapterStub(service: MockService())
        adapter.filteredList(option: .status, filteredKey: "Alive")
        XCTAssertEqual(adapter.characters[0].status.rawValue, "Alive")
    }
    
    func testFilteredListByGenderAdapter() async {
        let adapter = CharacterAdapter(service: Service())
        adapter.filteredList(option: .gender, filteredKey: "Male")
        XCTAssertNotNil(adapter.characters)
        guard let character = adapter.characters.first(where: { character in
            character.gender.rawValue == "Male"
        })
        else {
            return
        }
        XCTAssertEqual(character.gender.rawValue, "Male")
        
    }
    
    func testFilteredListByStatusAdapter() {
        let adapter = CharacterAdapter(service: Service())
        adapter.filteredList(option: .status, filteredKey: "Alive")
        guard let character = adapter.characters.first(where: { character in
            character.status.rawValue == "Alive"
        })
        else {
            return
        }
        XCTAssertEqual(character.status.rawValue, "Alive")
    }
    
}
