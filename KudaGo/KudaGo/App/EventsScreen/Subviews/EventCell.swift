//
//  EventCell.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 22.01.23.
//

import SwiftUI

struct EventCell: View {
    
    @ObservedObject var asyncImage: AsyncImageService
    
    @State var eventName: String
    
    init(urlString: String?, eventName: String) {
        asyncImage = AsyncImageService(urlString: urlString)
        self.eventName = eventName
    }
    
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .cornerRadius(20)
            VStack(spacing: 20) {
                ZStack {
                    Image(uiImage: asyncImage.image ?? .init())
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: UIScreen.screenWidth * 0.7)
                }
                ZStack {
                    Text(eventName)
                        .font(.customFont(weight: .medium, size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .opacity(asyncImage.isLoaded ? 1 : 0)
                        .frame(width: UIScreen.screenWidth * 0.7)
                }
            }
            .opacity(asyncImage.isLoaded ? 1 : 0)
            
            if !asyncImage.isLoaded {
                LoadingEventCell()
                    .foregroundColor(.gray)
            }
        }
        .frame(
            width: UIScreen.screenWidth * 0.8,
            height: UIScreen.screenHeight * 0.4)
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            EventCell(
                urlString: "https://cdn.urlencoder.org/assets/images/url-fb.png",
                eventName: "EVENT EVENT EVENT EVENT EVENT EVENT EVENT")
        }
        .previewLayout(.sizeThatFits)
    }
}
