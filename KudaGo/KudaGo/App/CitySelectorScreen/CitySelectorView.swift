//
//  CitySelectorView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

struct CitySelectorView: View {
    
    @ObservedObject var viewModel: CitySelectorViewModel
    
    var body: some View {
        ZStack {
            Color.init(hex: "1d1d1d")
                .ignoresSafeArea()
            
            if $viewModel.isCitiesLoaded.wrappedValue {
                VStack {
                    Spacer()
                    Text("chooseCity")
                        .foregroundColor(.white)
                        .font(.customFont(weight: .semibold, size: 24))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 45)
                        .frame(width: UIScreen.screenWidth * 0.8)
                }
                
                SnapCarouselView(cities: $viewModel.cities.wrappedValue)
            } else {
                ProgressView()
                    .foregroundColor(.white)
            }
        }
    }
}

struct CitySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectorView(viewModel: .init())
    }
}
