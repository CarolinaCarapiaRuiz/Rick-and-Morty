//
//  MainView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI

struct MainView: View {
    let service: Service = Service()
    var body: some View {
        TabView {
            let characterViewModel = CharacterViewModel(service: service)
            CharacterView(viewModel: characterViewModel)
                .tabItem {
                    Label("Character", systemImage: "person.circle.fill")
                }
            let locationViewModel = LocationsViewModel(service: service)
            LocationView(viewModel: locationViewModel)
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
