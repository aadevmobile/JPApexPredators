//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Anie on 1/3/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    //PROPERTIES
    let predators = Predators()
    
    @State var searchText: String = ""
    @State var alphabetical = false
    @State var currentSelection = APType.all
    
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        
        return predators.search(for: searchText)
    }
        
    
    //BODY
    var body: some View {
        NavigationStack {
            // >> LIST WITH SELECTED PREDATORS
            List(filteredDinos) { predator in
                NavigationLink {
                    PredatorDetail(predator: predator,
                        position: .camera(
                        MapCamera(
                            centerCoordinate:
                                predator.location,
                            distance: 30000
                        )))
                } label: {
                    // HSTACK FOR EACH PREDATOR
                    HStack{
                        
                        // predator image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        // >> VSTACK WITH NAME AND TYPE
                        VStack (alignment: .leading) {
                            
                            // predator name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            // predator type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.backgroundColor)
                                .clipShape(.capsule)
                            
                        } // VSTACK <<
                    } // HSTACK <<
                } // LABEL <<
            } // LIST <<
            // LIST MODIFIERS
            //navigation stack title
            .navigationTitle(" Apex Predators")
            //search bar, requires state var
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            // toolbar icon for sort, alphabetically or by movie apperance order
            .toolbar {
                // sort item, top left
                ToolbarItem (placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        //Ternary IF format
                        Image(systemName: alphabetical ? "textformat" : "film")
                            .symbolEffect(.bounce, value: alphabetical)
                    } // toolbar item label
                }//toolbar item
                ToolbarItem (placement: .topBarTrailing){
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(APType.allCases){
                                type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                                
                            }
                        }
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            } // toolbar
        } // NAVIGATION STACK <<
        .preferredColorScheme(.dark)
    } // VIEW <<
} // STRUCT <<


// PREVIEW
#Preview {
    ContentView()
}
