//
//  CardView.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 12/10/20.
//

import SwiftUI

struct CardView: View, Identifiable {
    //MARK: - Properties
    
    let id = UUID()
    var dest: Destination
    
    var body: some View {
        Image(dest.image)
            .resizable()
            .scaledToFill()
            .cornerRadius(24)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15) {
                    Text(dest.place.uppercased())
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .fontWeight(.black)
                        .shadow(radius: 10)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    Text(dest.country.uppercased())
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(width: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                    
                }
                .frame(minWidth: 280)
                .padding(.bottom, 50),
                alignment: .bottom
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(dest: destinationData[2])
            .previewLayout(.fixed(width: 375, height: 500))
    }
}
