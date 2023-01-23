//
//  FetchingEventsView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import SwiftUI

struct FetchingEventsView: View {
    var body: some View {
        ZStack {
            Color.init(hex: "1d1d1d")
                .ignoresSafeArea()
            
            VStack(spacing: 20)  {
                Text("📆")
                    .font(.system(size: 80))
                
                ProgressView()
                
                Text("gettingEvents")
                    .font(.customFont(weight: .light, size: 20))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FetchingEventsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchingEventsView()
    }
}
