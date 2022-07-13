//
//  ContentView.swift
//  vk_sirius
//
//  Created by Ivan Vislov on 12.07.2022.
//

import SwiftUI

@MainActor
struct ContentView: View {
    @Environment(\.openURL) var openURL
    @StateObject var serviceData = ServiceViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(serviceData.services, id: \.name) { service in
                        Button {
                            openURL(URL(string: service.link)!)
                        } label: {
                            CardService(service: service)
                        }
                        .buttonStyle(.plain)

                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationBarTitle("Сервисы VK")
            .alert(isPresented: $serviceData.error, content: {
                Alert(
                    title: Text(serviceData.errorMsg)
                )
            })
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
