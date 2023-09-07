//
//  BeerViewModel.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 14/8/23.
//

import Foundation
import Combine
import Factory

class BeerViewModel: ObservableObject {
    
    @Injected(\.beerServide) private var beerRepository
    
    @Published var myRandomBeer: Beer? = nil
        
    @Published var searchText: String = ""
    
    @Published var listOfBeers = [Beer]() 
    
    var cancellableSet = Set<AnyCancellable>()
    
    func getRandomBeer() {
        let _ = beerRepository.getRangomBeer()
            .sink(receiveCompletion: {
                print("Received completion \($0)")
            }, receiveValue: { [unowned self] beer in
                self.myRandomBeer = beer
            })
            .store(in: &cancellableSet)
    }
    
    
    func searchBears() {
        let _ = beerRepository.searchBeers(with: searchText)
            .sink(receiveCompletion: {
                print("Received completion \($0)")
            }, receiveValue: { [unowned self] beers in
                self.listOfBeers = beers ?? []
            })
            .store(in: &cancellableSet)
    }
    
    
    
    
}
