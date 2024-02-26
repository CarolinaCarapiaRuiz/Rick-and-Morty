//
//  LocationView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI

struct LocationView<T>: View where T: LocationsPort {
    @ObservedObject private var locationsAdapter: T
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: Constants.SizeModifiers.gridSpacing) {
                    ForEach(locationsAdapter.locations, id: \.id) { location in
                        LocationColletionRowView(location: location)
                    }
                }
            }
            .padding(.horizontal, Constants.SizeModifiers.padding)
            .navigationTitle(Constants.Localizables.locationTitle)
            .task {
                await locationsAdapter.getLocations()
            }
        }
    }
    init(adapter: T) {
        self.locationsAdapter = adapter
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let service: Service = Service()
        let adapter = LocationsAdapter(service: service)
        LocationView(adapter: adapter)
    }
}
