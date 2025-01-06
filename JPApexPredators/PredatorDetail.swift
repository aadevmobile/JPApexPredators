//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Anie on 1/5/25.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack //(alignment: .bottomTrailing)
                {
                    // background image
                    Image( predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // predator image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                    
                } // ZSTACK <<
               
                
                // predator name
                
                // current location
                
                // appears in
                
                // movie moments
                
                // link to webpage
                
                
            } // SCROLLVIEW <<
        } // GEOMETRY READER <<
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
}
