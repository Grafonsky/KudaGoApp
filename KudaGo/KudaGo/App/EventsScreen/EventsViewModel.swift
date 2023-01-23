//
//  EventsViewModel.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

final class EventsViewModel: ObservableObject {
    
    @Published var slug: String
    @Published var cityName: String
    @Published var events: [EventsResults] = []
    @Published var isPresented: Bool = false
    @Published var isLoading: Bool = false
    
    var currentPage: Int = 1
    
    init(slug: String, cityName: String) {
        self.slug = slug
        self.cityName = cityName
        self.isLoading = true
        loadEvents(page: 1)
    }
    
    func loadEvents(page: Int) {
        isLoading = true
        print("📃 Current page: \(currentPage)")
        Task {
            let result = await KudaGoService.shared.getEvents(city: self.slug, page: page)
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.events.append(contentsOf: success)
                    self?.isLoading = false
                    self?.isPresented = true
                }
            case .failure(let error):
                print("INSERT FAILURE ALERT")
                print(error.localizedDescription)
            }
        }
    }
}
