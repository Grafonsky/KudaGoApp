//
//  KudaGoEndpoint.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation
import Networking

enum KudaGoEndpoint {
    case cities, events
}

extension KudaGoEndpoint: Networking.Endpoint {
    var baseURL: URL? {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = "kudago.com"
        //        components.host = "kudago.com/public-api/v1.4"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = .init()
        let locale = Locale.current.identifier.components(separatedBy: "_").first ?? "en"
        switch self {
        case .cities:
            let langItem: URLQueryItem = .init(name: "lang", value: locale)
            let fieldsItem: URLQueryItem = .init(name: "fields", value: "slug,name,coords")
            let orderByItem: URLQueryItem = .init(name: "order_by", value: "")
            queryItems = [langItem, fieldsItem, orderByItem]
            return queryItems
        case .events:
            return []
        }
    }
    
    var path: String {
        switch self {
        case .cities:
            return "/public-api/v1.4/locations/"
        case .events:
            return ""
        }
    }
    
    var method: Networking.HTTPRequestMethod {
        switch self {
        case .cities, .events:
            return .get
        }
    }
    
    var header: [String : String]? {
        var header: [String: String] = [:]
        header["Content-Type"] = "application/json; charset=utf-8"
        return header
    }
    
    var body: [String : String]? {
        return nil
    }
    
    
}
