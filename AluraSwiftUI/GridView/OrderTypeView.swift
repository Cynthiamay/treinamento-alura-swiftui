//
//  OrderTypeView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct OrderTypeView: View {
    let orderType: OrderType
    
    var body: some View {
        VStackLayout(spacing: 5) {
            Image(orderType.image).resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text(orderType.name)
                .font(.system(size: 10))
        }
        .frame(width: 70, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OrderTypeView(orderType: OrderType(id: 1,
                                       name: "Restaurantes",
                                       image: "hamburguer"))
}
