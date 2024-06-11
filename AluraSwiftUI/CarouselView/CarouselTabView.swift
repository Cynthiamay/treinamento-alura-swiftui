//
//  CarouselTabView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct CarouselTabView: View {
    let orders: [OrderType] = [
    OrderType(id: 1, name: String(), image: "barbecue-banner"),
    OrderType(id: 2, name: String(), image: "brazilian-meal-banner"),
    OrderType(id: 3, name: String(), image: "pokes-banner")
    ]
    
    var body: some View {
        TabView {
            ForEach(orders) { mock in
                CarouselItemView(order: mock)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
