//
//  KudaGoService.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation
import Networking

final class KudaGoService: Networking.HTTPClient {
    
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
}
