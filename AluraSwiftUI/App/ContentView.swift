//
//  ContentView.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                })
            }
        }
        
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://private-c25a8b-cynthiamay.apiary-mock.com/home") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as? [[String:Any]]
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
