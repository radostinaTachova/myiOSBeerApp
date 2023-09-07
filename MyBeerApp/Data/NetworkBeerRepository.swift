//
//  NetworkBeerRepository.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 18/8/23.
//

import Foundation
import Combine

class NetworkBeerRepository: BeerRepository {
    
    private var session = URLSession.shared
    private let baseURL = "https://api.punkapi.com/v2/"
    
    
    func getRangomBeer() -> AnyPublisher<Beer?, Error> {
        let url = baseURL + "/beers/random"
        return session.dataTaskPublisher(for: URL(string: url)!) //TODO: change !
            .tryMap{ data, response in
                //TODO: error handling
                let randomBeer = try? JSONDecoder().decode([BeerApiModel].self, from: data)
                guard (randomBeer != nil) else {
                    return nil
                }
                return randomBeer?.first?.toBeer()
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func searchBeers(with name: String) -> AnyPublisher<[Beer]?, Error> {
        let url = baseURL + "beers"
        var components = URLComponents(string: url)
        components?.queryItems = [
            URLQueryItem(name: "beer_name", value: name)
        ]
        return session.dataTaskPublisher(for: URL(string: components?.string ?? "")!) //TODO: change !
            .tryMap{ data, response in
                //TODO: error handling
                let listOfBeers = try? JSONDecoder().decode([BeerApiModel]?.self, from: data)
                return listOfBeers?.map({ beerApiModel in beerApiModel.toBeer() })
                
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
