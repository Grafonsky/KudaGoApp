//
//  KudaGoEndpoint.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

enum KudaGoEndpoint {
    case cities, events(city: String, page: Int)
}

extension KudaGoEndpoint: Endpoint {
    var baseURL: URL? {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = "kudago.com"
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
        case .events(let city, let page):
            let langItem: URLQueryItem = .init(name: "lang", value: locale)
            let pageItem: URLQueryItem = .init(name: "page", value: String(page))
            let pageSizeItem: URLQueryItem = .init(name: "page_size", value: "20")
            let fieldsItem: URLQueryItem = .init(name: "fields", value: "dates,title,place,description,body_text,location,images,tags")
            let expandItem: URLQueryItem = .init(name: "expand", value: "")
            let orderByItem: URLQueryItem = .init(name: "order_by", value: "-publication_date")
            let textFormat: URLQueryItem = .init(name: "text_format", value: "text")
            let idsItem: URLQueryItem = .init(name: "ids", value: "")
            let locationItem: URLQueryItem = .init(name: "location", value: city)
            let actualSinceItem: URLQueryItem = .init(name: "actual_since", value: String(Date.currentTimeStamp))
            let actualUntilItem: URLQueryItem = .init(name: "actual_until", value: "")
            let isFreeItem: URLQueryItem = .init(name: "is_free", value: "")
            let categoriesItem: URLQueryItem = .init(name: "categories", value: "")
            queryItems = [
                langItem, pageItem, pageSizeItem, fieldsItem,
                expandItem, orderByItem, textFormat, idsItem,
                locationItem, actualSinceItem, actualUntilItem, isFreeItem,
                categoriesItem
            ]
            return queryItems
        }
    }
    
    var path: String {
        switch self {
        case .cities:
            return "/public-api/v1.4/locations/"
        case .events:
            return "/public-api/v1.4/events/"
        }
    }
    
    var method: HTTPRequestMethod {
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
