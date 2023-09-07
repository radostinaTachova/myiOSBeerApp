//
//  BeerView.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 14/8/23.
//

import SwiftUI

struct BeerView: View {
    
    var selectedBeer: Beer
    
    var body: some View {
        VStack {
            HStack {
                //Beer image
                beerImage
                //Beer general info
                generalInfo
            }
            //Description
            descriptionView
            Spacer()
        }
    }
    
    var beerImage: some View {
        AsyncImage(url: URL(string: selectedBeer.image_url ?? ""), content: { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(5)
                .overlay {
                    Circle().stroke(.gray, lineWidth: 2)
                }
        }, placeholder: {
            Image(systemName: "photo")
                .font(.largeTitle)
        })
    }
    
    var generalInfo: some View {
        VStack(alignment: .leading) {
            Text(selectedBeer.name)
                .font(.headline)
                .foregroundColor(.init("primaryColor"))
            Text(selectedBeer.tagline)
                .font(.body)
                .foregroundColor(.gray)
            
            
            Text("ABV \(selectedBeer.abv, specifier: "%.1f")")
                .padding(5)
                .overlay {
                    Capsule().stroke(.gray, lineWidth: 1)
                }
        }.padding()
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Divider()
            Text("Description")
                .font(.headline)
                .foregroundColor(.init("primaryColor"))
            Text(selectedBeer.description)
            Divider()
        }.padding([.leading, .trailing])
    }
    
}

struct BeerView_Previews: PreviewProvider {

    static var previews: some View {
        BeerView(selectedBeer: previewTestBeer)
    }
}
