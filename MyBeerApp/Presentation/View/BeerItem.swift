//
//  BeerItem.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 23/8/23.
//

import SwiftUI

struct BeerItem: View {
    var beer: Beer
    
    var body: some View {
        VStack {
            HStack {
                beerImage
                beerTitle
                Spacer()
            }
        }
    }
    
    var beerImage: some View {
        AsyncImage(url: URL(string: beer.image_url ?? ""), content: { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(5)
                .overlay {
                    Circle().stroke(.gray, lineWidth: 2)
                }
        }, placeholder: {
            Image(systemName: "photo")
                .font(.largeTitle)
                .frame(width: 50, height: 50)
        })
    }
    
    var beerTitle: some View {
        Text(beer.name)
            .foregroundColor(.init("primaryColor"))
            .padding([.leading])
    }
    
}

struct BeerItem_Previews: PreviewProvider {
    static var previews: some View {
        BeerItem(beer: previewTestBeer)
    }
}
