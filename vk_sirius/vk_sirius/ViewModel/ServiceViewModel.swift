//
//  ServiceViewModel.swift
//  vk_sirius
//
//  Created by Ivan Vislov on 12.07.2022.
//

import SwiftUI

class ServiceViewModel: ObservableObject{
    @Published var error: Bool = false
    @Published var errorMsg: String = ""
    @Published var services: [ServiceModel] = []
    
    init(){
        Task{
            do{
                try await getData()
            }catch{
                DispatchQueue.main.async {
                    self.errorMsg = error.localizedDescription
                    self.error.toggle()
                }
            }
        }
    }
    
    func getData() async throws{
        let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")!
        let urlSession = URLSession.shared
        
        let (data, _) = try await urlSession.data(from: url)
        self.services = try JSONDecoder().decode(DataModel.self, from: data).body.services
    }
}
