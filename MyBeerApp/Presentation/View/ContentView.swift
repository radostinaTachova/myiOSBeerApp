//
//  ContentView.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 14/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var beerModel = BeerViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(beerModel.listOfBeers, content:  { beer in
                    NavigationLink(value: beer, label: {
                        BeerItem(beer: beer)
                    })
                })
                
            }.searchable(text: $beerModel.searchText, prompt: Text("Search a beer..."))
                .onChange(of: beerModel.searchText, perform: { newValue in
                    beerModel.searchBears()
                })
                .navigationDestination(for: Beer.self, destination: { beer in
                    BeerView(selectedBeer: beer)
                })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
