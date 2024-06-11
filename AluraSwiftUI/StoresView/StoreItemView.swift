//
//  StoreItemView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            VStack {
                Text(order.name)
                    .font(.subheadline)
            }
            Spacer()
        }
        .onTapGesture {
            print("clicou em \(order.name)")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreItemView(order: OrderType(id: 1,
                                   name: "Açaí Panda", image: "acai-panda-logo"))
}
