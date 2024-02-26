//
//  Rick_and_MortyTests.swift
//  Rick and MortyTests
//
//  Created by Carolina Carapia on 21/02/24.
//

import XCTest
@testable import Rick_and_Morty

final class Rick_and_MortyTests: XCTestCase {
    
    func testFilteredList(option: FilterOption, filteredKey: String) throws {
        let adapter: CharactersAdapterStub = CharactersAdapterStub(service: MockService())
        adapter.filteredList(option: .gender, filteredKey: "Male")
        XCTAssertEqual(adapter.characters.first?.name, "Rick Sanchez")
    }

}
