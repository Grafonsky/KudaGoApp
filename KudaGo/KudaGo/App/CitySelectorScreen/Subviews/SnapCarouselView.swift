//
//  SnapCarouselView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI
import Combine

// MARK: - ForEach Items Store

struct CityItem: Identifiable {
    var id: Int
    var city: CityModel
}

class CityStore: ObservableObject {
    
    @Published var items: [CityItem]
    
    var bag: Set<AnyCancellable> = .init()
    var cities: [CityModel] = []
    
    init(cities: [CityModel]) {
        items = []
        self.cities = cities
        for i in cities.indices {
            let new = CityItem(id: i,
                               city: cities[i])
            items.append(new)
        }
    }
}

// MARK: - View

struct SnapCarouselView: View {
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var store: CityStore
    
    init(cities: [CityModel]) {
        self.store = .init(cities: cities)
    }
    
    var body: some View {
        ZStack {
            ForEach(store.items) { item in
                ZStack {
                    CityCellView(name: item.city.name, slug: item.city.slug)
                }
                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                .offset(x: myXOffset(item.id) * 1.45, y: 0)
                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                .animation(.spring())
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation {
                            draggingItem = snappedItem + value.translation.width / 350
                        }
                    }
                    .onEnded { value in
                        withAnimation {
                            draggingItem = snappedItem + value.predictedEndTranslation.width / 350
                            draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                            snappedItem = draggingItem
                        }
                    }
            )
        }
    }
}

struct SnapCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        SnapCarouselView(cities: [])
    }
}

// MARK: - Extension

private extension SnapCarouselView {
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 200
    }
}
