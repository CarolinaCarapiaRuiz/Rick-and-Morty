//
//  CharacterDetailView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let adapter: CharacterDetailAdapter
    let character: Characters
    let cardAndImageWidth: CGFloat = 350
    let cardHeight: CGFloat = 600
    let imageHeight: CGFloat = 116
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(SwiftUI.Color.gray, lineWidth: Constants.SizeModifiers.lineWidth)
                    .frame(width: cardAndImageWidth, height: cardHeight)
                    .background(SwiftUI.Color.white)
                
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: character.image)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .frame(width: cardAndImageWidth, height: Constants.SizeModifiers.imageHeight)
                                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                                .shadow(color: Color.gray, radius: Constants.SizeModifiers.imageRadius)
                        }
                    }
                    VStack(alignment: .leading, spacing: Constants.SizeModifiers.leadingSpacing) {
                        HStack{
                            HStack {
                                Text(Constants.Localizables.specieTitle)
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                Text(character.species)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                            HStack {
                                Text(Constants.Localizables.genderTitle)
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                Text(character.gender.rawValue)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: Constants.SizeModifiers.leadingSpacing){
                            HStack {
                                Text(Constants.Localizables.statusTitle)
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                Text(character.status.rawValue)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                            HStack {
                                Text(Constants.Localizables.originTitle)
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                Text(character.origin.name)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        HStack {
                            Text(Constants.Localizables.locationTitle)
                                .font(.title3)
                                .foregroundStyle(.primary)
                            Text(character.location.name)
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                    }.padding(Constants.SizeModifiers.leadingSpacing)
                    Spacer()
                }.foregroundColor(Color("Blue"))
            }
            .cornerRadius(cornerRadius)
        }.navigationTitle(character.name)
        
    }
    
    init(adapter: CharacterDetailAdapter) {
        self.adapter = adapter
        self.character = self.adapter.character
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let character: Characters = Characters(id: 1, name: "Rick Sanchez", status: .alive, species: "Human", type: "", gender: .male, origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: SingleLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2", "https://rickandmortyapi.com/api/episode/3"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        CharacterDetailView(adapter: CharacterDetailAdapter(character: character))
    }
}
