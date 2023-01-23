//
//  EventsView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI
import Combine

struct EventsView: View {
    
    @ObservedObject var viewModel: EventsViewModel
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 250, maximum: 500), spacing: 16.0),
    ]
    
    var body: some View {
        ZStack {
            CityBackground(slug: $viewModel.slug.wrappedValue)
            ScrollView(showsIndicators: true) {
                LazyVGrid(columns: columns) {
                    let localized = NSLocalizedString("eventsIn", comment: "")
                    let title = String(format: localized, $viewModel.cityName.wrappedValue)
                    
                    Text(title)
                        .font(.customFont(weight: .black, size: 34))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    ForEach(viewModel.events, id: \.id) { item in
                        Button {
                            print(item.title?.capitalizingFirstLetter())
                        } label: {
                            EventCell(urlString: item.images?.first?.image,
                                      eventName: item.title?.capitalizingFirstLetter() ?? "")
                            .aspectRatio(contentMode: .fit)
                        }
                    }
                    Color.clear
                        .frame(width: 0, height: 0, alignment: .bottom)
                        .onAppear {
                            viewModel.currentPage += 1
                            viewModel.loadEvents(page: viewModel.currentPage)
                        }
                }
                if $viewModel.isLoading.wrappedValue {
                    ZStack {
                        VStack {
                            Spacer()
                            VisualEffectView(effect: UIBlurEffect(style: .light))
                                .frame(width: UIScreen.screenWidth * 0.7, height: 40)
                                .cornerRadius(20)
                            
                        }
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    }
                }
            }
            if !$viewModel.isPresented.wrappedValue {
                FetchingEventsView()
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(viewModel: .init(slug: "spb", cityName: "Saint-Petersburg"))
    }
}
