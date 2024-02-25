//
//  CharacterViewCell.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 22/02/24.
//

import SwiftUI

struct CharacterViewCell: View {
    var character: Characters
    var body: some View {
        HStack {
            let imageLength: Double = Constants.SizeModifiers.imageLength
            
            AsyncImage(url: URL(string: character.image)) { phase in
                if let image = phase.image {
                    image.resizable()// Displays the loaded image.
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(Color.gray, lineWidth: Constants.SizeModifiers.lineWidth))
                        .shadow(color: Color.gray, radius: Constants.SizeModifiers.radius)
                }
            }
            
            .frame(width: imageLength, height: imageLength)
            .padding(Constants.SizeModifiers.padding)
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack {
                    Text(Constants.Localizables.specieTitle)
                        .fontWeight(.semibold)
                    Text(character.species)
                }
                HStack{
                    Text(Constants.Localizables.originTitle)
                        .fontWeight(.semibold)
                    Text(character.origin.name)
                }
            }
            Spacer()
        }.foregroundColor(Color("Blue"))
    }
}

struct CharacterViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewCell(character: Characters(id: 1, name: "Rick", status: .alive, species: "Human", type: "", gender: .male, origin: Origin(name: "Earth (C-137)", url: ""), location: SingleLocation(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [""], url: "", created: "")).previewLayout(.fixed(width: 300, height: 30))
    }
}
