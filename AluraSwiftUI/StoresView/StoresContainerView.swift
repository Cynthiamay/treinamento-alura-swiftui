//
//  StoresContainerView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    let orders: [OrderType] = [
    OrderType(id: 1, name: "Panda Açaí", image: "acai-panda-logo"),
    OrderType(id: 2, name: "Padaria", image: "bakery-logo"),
    OrderType(id: 3, name: "Mexican", image: "carbron-logo"),
    OrderType(id: 4, name: "Food", image: "food-court-logo"),
    OrderType(id: 5, name: "Monstro Burger", image: "monstro-burger-logo")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            VStack(alignment: .leading, spacing: 30) {
                ForEach(orders) { mock in
                    StoreItemView(order: mock)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
}
