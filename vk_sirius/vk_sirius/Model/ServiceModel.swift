//
//  ServiceModel.swift
//  vk_sirius
//
//  Created by Ivan Vislov on 12.07.2022.
//

import Foundation

struct ServiceModel: Codable{
    let name: String
    let serviceDescription: String
    let link: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case serviceDescription = "description"
        case link
        case iconURL = "icon_url"
    }
}
