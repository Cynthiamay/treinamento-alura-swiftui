//
//  ContentView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: self.storesType)
                        }
                    })
                }
            }
        }
        
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    func getStores() async {
        do{
            let result = try await service.fetchData()
            switch result {
            case.success(let stores):
                self.storesType = stores
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
    ContentView()
}
