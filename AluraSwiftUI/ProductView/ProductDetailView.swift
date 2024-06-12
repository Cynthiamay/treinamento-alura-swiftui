//
//  ProductDetailView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 12/06/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity = 1

    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            //Ligacao entre duas variaveis Binding $
            ProductDetailQuantityView(productQuantity: $productQuantity)
//            Text("\(productQuantity)")
            
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    var body: some View {
        Button(action: {
            print("testando")
        }, label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                    x: 6,
                    y: 8)
        })
    }
}
