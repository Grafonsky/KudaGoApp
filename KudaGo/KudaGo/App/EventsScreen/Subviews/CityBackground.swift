//
//  CityBackground.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import SwiftUI

struct CityBackground: View {
    
    @State var slug: String
    
    var body: some View {
        Color.init(hex: "1d1d1d")
            .ignoresSafeArea()
        VStack {
            Image(slug)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            Spacer()
        }
        Rectangle()
            .foregroundColor(.clear)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            .clear,
                            Color.init(hex: "1d1d1d"),
                            Color.init(hex: "1d1d1d"),
                            Color.init(hex: "1d1d1d")]),
                    startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
    }
}

struct CityBackground_Previews: PreviewProvider {
    static var previews: some View {
        CityBackground(slug: "spb")
    }
}
