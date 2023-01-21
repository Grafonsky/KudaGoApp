//
//  KudaGoApp.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

@main
struct KudaGoApp: App {
    var body: some Scene {
        WindowGroup {
            CitySelectorView(viewModel: .init())
        }
    }
}
