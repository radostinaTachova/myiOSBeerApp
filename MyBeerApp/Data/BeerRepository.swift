//
//  BeerRepository.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 18/8/23.
//

import Foundation
import Combine

protocol BeerRepository {
    
    func getRangomBeer() -> AnyPublisher<Beer?, Error>
    
    func searchBeers(with name: String) -> AnyPublisher<[Beer]?, Error>
}
