//
//  ContentView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("KudaGoApp init")
        }
        .padding()
        .onAppear {
            Task {
                let cities = await KudaGoService.shared.getCities()
                print(cities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
