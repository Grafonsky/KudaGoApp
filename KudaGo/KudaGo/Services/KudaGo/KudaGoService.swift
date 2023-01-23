//
//  KudaGoService.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

final class KudaGoService: HTTPClient {
    
    static let shared = KudaGoService()
    
    func getCities() async -> Result<[CityModel], HTTPRequestError> {
        let result = await sendRequest(
            endpoint: KudaGoEndpoint.cities,
            responseModel: [CityModel].self)
        switch result {
        case .success(let citiesArr):
            return .success(citiesArr)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getEvents(city: String, page: Int = 1) async -> Result<[EventsResults], HTTPRequestError> {
        let result = await sendRequest(
            endpoint: KudaGoEndpoint.events(city: city, page: page),
            responseModel: EventsModel.self)
        switch result {
        case .success(let success):
            return .success(success.results)
        case .failure(let error):
            return .failure(error)
        }
    }
}
