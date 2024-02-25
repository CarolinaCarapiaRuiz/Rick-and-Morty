//
//  LocationView.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 21/02/24.
//

import SwiftUI

struct LocationView<T>: View where T: LocationsViewModelProtocol {
    @ObservedObject private var locationsViewModel: T
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 5) {
                    ForEach(locationsViewModel.locations, id: \.id) { location in
                        LocationColletionRowView(location: location)
                    }
                }
            }
            .padding(.horizontal, 10.0)
            .navigationTitle("Locations")
            .task {
                await locationsViewModel.getLocations()
            }
        }
    }
    init(viewModel: T) {
        self.locationsViewModel = viewModel
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let service: Service = Service()
        let viewModel = LocationsViewModel(service: service)
        LocationView(viewModel: viewModel)
    }
}
