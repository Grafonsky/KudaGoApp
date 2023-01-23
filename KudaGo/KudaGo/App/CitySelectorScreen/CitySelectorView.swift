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
                    Image("KudaGoLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 25)
                    
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
                if $viewModel.isLoadingFailed.wrappedValue {
                    Text("connectToTheInternet")
                        .font(.customFont(weight: .light, size: 28))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                }
            }
        }
    }
}

struct CitySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectorView(viewModel: .init())
    }
}
