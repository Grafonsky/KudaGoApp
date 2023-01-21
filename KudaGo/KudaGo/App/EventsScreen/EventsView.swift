//
//  EventsView.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

struct EventsView: View {
    
    @State var slug: String
    
    var body: some View {
        Text(slug)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(slug: "spb")
    }
}
