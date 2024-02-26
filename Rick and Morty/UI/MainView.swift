//
//  MainView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI

struct MainView: View {
    let service: ServicePort = Service()
    var body: some View {
        TabView {
            let characterAdapter = CharacterAdapter(service: service)
            CharacterView(adapter: characterAdapter)
                .tabItem {
                    Label("Character", systemImage: "person.circle.fill")
                }
            let locationsAdapter = LocationsAdapter(service: service)
            LocationView(adapter: locationsAdapter)
                .tabItem {
                    Label("Location", systemImage: "location.circle.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
