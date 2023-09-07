//
//  InjectionKey.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 18/8/23.
//

import Factory

extension Container {
    var beerServide: Factory<BeerRepository> {
        Factory(self) { NetworkBeerRepository() }
    }
}


//TODO: Define your dependencies’ scopes (optional).
//  Scopes are used to define the lifetime of resolved dependencies. Factory provides several scope types, including Singleton, Cached, Graph, Shared, and Unique.
