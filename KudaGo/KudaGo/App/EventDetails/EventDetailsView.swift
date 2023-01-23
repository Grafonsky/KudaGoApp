//
//  EventDetailsView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import SwiftUI

struct EventDetailsView: View {
    
    @ObservedObject var asyncImage: AsyncImageService
    
    @State var title: String
    @State var eventDescription: String
    @State var startEvent: Int
    @State var endEvent: Int
    @State var slug: String
    
    init(asyncImage: AsyncImageService,
         title: String,
         eventDescription: String,
         startEvent: Int,
         endEvent: Int,
         slug: String) {
        self.asyncImage = asyncImage
        self.title = title
        self.eventDescription = eventDescription
        self.startEvent = startEvent
        self.endEvent = endEvent
        self.slug = slug
    }
    
    var body: some View {
        ZStack {
            CityBackground(slug: slug)
            
            ScrollView {
                VStack(spacing: 25) {
                    Text(title.capitalizingFirstLetter())
                        .font(.customFont(weight: .black, size: 34))
                        .multilineTextAlignment(.center)
                        .shadow(radius: 5)
                    Text(eventDescription)
                        .font(.customFont(weight: .regular, size: 18))
                    HStack {
                        let localizedStart = NSLocalizedString("startEvent", comment: "")
                        let start = String(format: localizedStart, DateFormatterService.shared.dateToString(time: startEvent))
                        let localizedEnd = NSLocalizedString("endEvent", comment: "")
                        let end = String(format: localizedEnd, DateFormatterService.shared.dateToString(time: endEvent))
                        VStack(alignment: .leading, spacing: 10) {
                            Text(start)
                            Text(end)
                        }
                        .font(.customFont(weight: .regular, size: 18))
                        Spacer()
                    }
                    Image(uiImage: asyncImage.image ?? .init())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth * 0.9)
                        .cornerRadius(20)
                }
                .frame(width: UIScreen.screenWidth * 0.9)
                .foregroundColor(.white)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(
            asyncImage: .init(urlString: ""),
            title: "",
            eventDescription: "",
            startEvent: 0,
            endEvent: 0,
            slug: "")
    }
}

