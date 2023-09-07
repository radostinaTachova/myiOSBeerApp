//
//  Beer.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 14/8/23.
//

import Foundation


struct BeerApiModel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String?
    let abv: Float
//    let ibu: Float
//    let target_fg: Float
//    let target_og: Float
//    let ebc: Float
//    let srm: Float
//    let ph: Float
    private enum CodingKeys: String, CodingKey {
        case id, name, tagline, first_brewed, description, image_url, abv
    }
}

//Mapper
extension BeerApiModel {
    func toBeer() -> Beer {
        Beer(id: self.id,
             name: self.name,
             tagline: self.tagline,
             first_brewed: self.tagline,
             description: self.description,
             image_url: self.image_url,
             abv: self.abv)
    }
}
