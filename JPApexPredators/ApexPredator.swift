//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Anie on 1/3/25.
//


import SwiftUI

// >> STRUCT APEX PREDATOR
struct ApexPredator: Decodable, Identifiable {
    
    //PROPERTIES
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    
    } // STRUCT APEX PREDATOR <<
    
    // >> STRUCT MOVIE SCENE
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    } // STRUCT MOVIE SCENE <<
    
    
    
} // STRUCT APEX PREDATOR <<

// >> ENUM AP TYPE
enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: APType { self }
    
    var backgroundColor: Color {
        switch self {
        case .all:
                .black
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
            
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
            
        }
    }
} // ENUM AP TYPE <<
