//
//  Endpoint.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL? { get }
    var queryItems: [URLQueryItem] { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
