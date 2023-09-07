//
//  Beer.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 7/9/23.
//

import Foundation

struct Beer: Identifiable, Hashable {
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String?
    let abv: Float
}


let previewTestBeer = Beer(id: 192, name: "Punk IPA 207", tagline: "Post Modern Classic. Spiky. Tropical. Hoppy.", first_brewed: "04/2007", description: "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.", image_url: "https://images.punkapi.com/v2/192.png", abv: 6.0)
