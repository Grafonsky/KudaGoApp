//
//  LoadingEventCell.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import SwiftUI

struct LoadingEventCell: View {
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ZStack {
                    Rectangle()
                        .frame(
                            width: UIScreen.screenWidth * 0.7,
                            height: UIScreen.screenHeight * 0.2)
                        .cornerRadius(10)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                }
                
                Rectangle()
                    .frame(width: UIScreen.screenWidth * 0.7, height: 40)
                    .cornerRadius(10)
            }
        }
    }
}

struct LoadingEventCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            LoadingEventCell()
        }
    }
}
