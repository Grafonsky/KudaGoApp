//
//  DateFormatterService.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import Foundation

final class DateFormatterService {
    
    static var shared = DateFormatterService()
    
    private let dateFormatter = DateFormatter()
    
    func dateToString(time: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        dateFormatter.dateFormat = "MMMM d yyyy, h:mm a"
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
