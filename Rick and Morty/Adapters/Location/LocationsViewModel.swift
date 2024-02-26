//
//  LocationsAdapter.swift
//  Rick and Morty
//
//  Created by Carolina Carapia on 23/02/24.
//

import Foundation

final class LocationsAdapter: LocationsPort {
    var service: ServicePort
    @Published var locations: [Location]

    init(service: ServicePort ) {
        self.service = service
        self.locations = [Location]()
    }
    
    func getLocations() async {
        service.execute(.listLocationsRequests, expenting: GetAllLocationsResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                DispatchQueue.main.async {
                    self.locations = model.results
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
