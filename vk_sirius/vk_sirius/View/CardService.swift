//
//  CardService.swift
//  vk_sirius
//
//  Created by Ivan Vislov on 12.07.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardService: View {
    let service: ServiceModel
    var body: some View {
        HStack(spacing: 15){
            WebImage(url: URL(string: service.iconURL))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 3){
                Text(service.name)
                    .font(.title2)
                
                Text(service.serviceDescription)
                    .font(.caption)
                    .lineLimit(2)
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct CardService_Previews: PreviewProvider {
    static var previews: some View {
        CardService(service: ServiceModel(name: "Test", serviceDescription: "Test", link: "https://vk.com/", iconURL: "https://publicstorage.hb.bizmrg.com/sirius/vk.png"))
    }
}
