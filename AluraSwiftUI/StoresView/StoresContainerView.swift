//
//  StoresContainerView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State private var minDistanceFilter: Double = 0
    @State private var maxDistanceFilter: Double = 100

    //definindo uma variavel computada
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter && (store.distance >= minDistanceFilter && store.distance < maxDistanceFilter)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Menu("Estrelas") {
                    Button(action: {
                        ratingFilter = 0
                    }, label: {
                        Text("Limpar filtro")
                    })
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) { rating in
                        Button(action: {
                            ratingFilter = rating
                        }, label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        })
                    }
                }
                .foregroundColor(.black)
                
                Menu("Distância") {
                    Button(action: {
                        minDistanceFilter = 0
                        maxDistanceFilter = 100
                    }, label: {
                        Text("Limpar filtro")
                    })
                    
                    Divider()
                    
                    ForEach(Array(stride(from: 0, through: 20, by: 5)), id:\.self) { distance in
                        Button(action: {
                            minDistanceFilter = Double(distance)
                            maxDistanceFilter = Double(distance + 5)
                        }, label: {
                            Text("De \(distance) até \(distance + 5) km")
                        })
                    }
                }
                .foregroundColor(.black)

            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
}
