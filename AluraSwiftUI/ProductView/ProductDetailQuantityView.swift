//
//  ProductDetailQuantityView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 12/06/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    @Binding var productQuantity: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button(action: {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                })
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button(action: {
                    productQuantity += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                })
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
