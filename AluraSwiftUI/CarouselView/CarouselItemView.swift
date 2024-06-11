//
//  CarouselItemView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct CarouselItemView: View {
    let order: OrderType
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselItemView(order: OrderType(id: 1,
                                      name: "",
                                      image: "pokes-banner"))
}
