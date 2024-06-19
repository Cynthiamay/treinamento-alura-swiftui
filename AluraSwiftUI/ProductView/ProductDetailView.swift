//
//  ProductDetailView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 12/06/24.
//

import SwiftUI

struct ProductDetailView: View {
    var service = HomeService()
    let product: ProductType
    @State private var productQuantity = 1
    @State private var isLoading = true

    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            //Ligacao entre duas variaveis Binding $
            ProductDetailQuantityView(productQuantity: $productQuantity)
//            Text("\(productQuantity)")
            
            Spacer()
            
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
    }
    
    func confirmOrder() async {
        do{
            let result = try await service.confirmOrder(product: product)
            switch result {
            case.success(let message):
                print(message)
                isLoading = false
            case.failure(let error):
                print(error.localizedDescription)
                isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            isLoading = false
        }

    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    var onButtonPress: () -> Void
    
    var body: some View {
        Button(action: {
            onButtonPress()
        }, label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
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
