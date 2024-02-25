//
//  LocationColletionRowView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 23/02/24.
//

import SwiftUI

struct LocationColletionRowView: View {
    var location: Location
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 1)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .shadow(color: Color.gray, radius: 3)
            
            
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Image(systemName: "location.circle")
                        .foregroundColor(Color.orange)
                    Text(location.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                }
                
                HStack {
                    Text("Type:")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                    Text(location.type)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                }
                VStack(alignment: .leading) {
                    Text("Dimension:")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                    Text(location.dimension)
                        .font(.body)
                        .fontWeight(.regular).foregroundStyle(.black)
                    
                }
            }
            .foregroundColor(Color("Blue"))
            .padding(.all, 10.0)
            
        }
    }
}

struct LocationColletionRowView_Previews: PreviewProvider {
    static var previews: some View {
        let location: Location = Location(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: ["https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/45", "https://rickandmortyapi.com/api/character/71",], url: "https://rickandmortyapi.com/api/location/1", created: "2017-11-10T12:42:04.162Z")
        LocationColletionRowView(location: location)
    }
}
