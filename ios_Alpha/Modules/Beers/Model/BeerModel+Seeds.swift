//
//  BeerModel+Seeds.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import Foundation

extension BeerModel {
    enum Seeds {
        static let example = BeerModel(
            id: 1,
            name: "Buzz",
            tagline: "A Real Bitter Experience.",
            description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
            imageURL: URL(string: "https://images.punkapi.com/v2/keg.png")!
        )
    }
}
