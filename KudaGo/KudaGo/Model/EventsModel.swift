//
//  EventsModel.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import Foundation

struct EventsModel: Decodable {
    let results: [EventsResults]
}

struct EventsResults: Decodable {
    let id: UUID = .init()
    let date: [EventDate]?
    var title: String?
    let description: String?
    let bodyText: String?
    let images: [EventImages]?
    let tags: [String]?
    
    enum CodingKeys: String, CodingKey {
        case date, title, description, images, tags
        case bodyText = "body_text"
    }
}

struct EventDate: Decodable {
    let start: Int
    let end: Int
}

struct EventImages: Decodable {
    let image: String
}
