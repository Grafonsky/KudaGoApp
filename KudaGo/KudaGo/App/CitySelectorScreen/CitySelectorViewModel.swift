//
//  CitySelectorViewModel.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

final class CitySelectorViewModel: ObservableObject {
    
    @Published var isCitiesLoaded: Bool = false
    @Published var cities: [CityModel] = []
    @Published var isLoadingFailed: Bool = false
    
    private var kudaService: KudaGoService {
        return .shared
    }
    
    init() {
        loadCitiesList()
    }
}

private extension CitySelectorViewModel {
    func loadCitiesList() {
        Task {
            let result = await kudaService.getCities()
            switch result {
            case .success(let cities):
                DispatchQueue.main.async { [weak self] in
                    self?.cities = cities
                    self?.isCitiesLoaded = true
                }
                
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.isLoadingFailed = true
                    AlertService.shared.presentAlert(
                        title: "error",
                        message: error.localizedDescription)
                }
            }
        }
    }
}
