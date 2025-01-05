//
//  Predators.swift
//  JPApexPredators
//
//  Created by Anie on 1/3/25.
//

import Foundation

class Predators {
    //PROPERTIES
    var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    
    //INIT
    init() {
        decodeApexPredatorData()
        print(self.apexPredators)
    }
    
    //DECODE FUNCTION:
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
    }
    
    // SEARCH FUNCTION
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            apexPredators
        } else {
            apexPredators.filter { predators in predators.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    // SORT FUNCTION
    func sort (by alphabetical:Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    //FILTER FUNCTION
    func filter (by type: APType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { predators in
                predators.type == type
            }
        }
    }
    
    
}
