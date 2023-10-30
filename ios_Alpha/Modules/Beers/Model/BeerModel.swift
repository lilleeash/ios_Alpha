//
//  BeerModel.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 16.10.2023.
//

import Foundation

typealias BeersModel = [BeerModel]

struct BeerModel: Decodable {
    let id: Int
    let name, tagline, description: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case imageURL = "image_url"
    }
}
