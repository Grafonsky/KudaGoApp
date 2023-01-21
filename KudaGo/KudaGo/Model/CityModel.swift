//
//  CityModel.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

struct CityModel: Decodable {
    let slug: String
    let name: String
    let coords: CityCoords
}

struct CityCoords: Decodable {
    let lat: Double?
    let lon: Double?
}
