//
//  CityCellView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

struct CityCellView: View {
    
    @State var name: String
    @State var slug: String
    @State var isCitySelected = false
    
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .cornerRadius(20)
            
            VStack {
                Image(slug)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.screenWidth * 0.7)
                    .cornerRadius(20)
                Text(name)
                    .font(.customFont(weight: .semibold, size: 24))
                    .foregroundColor(.white)
            }
            .onTapGesture {
                isCitySelected = true
            }
            .fullScreenCover(isPresented: $isCitySelected) {
                EventsView(slug: slug)
            }
        }
        .frame(
            width: UIScreen.screenWidth * 0.8,
            height: UIScreen.screenHeight * 0.4)
    }
}

struct CityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CityCellView(
            name: "City name",
            slug: "nnv")
    }
}
