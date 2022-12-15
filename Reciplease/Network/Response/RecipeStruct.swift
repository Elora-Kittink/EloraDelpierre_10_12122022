//
//  RecipeStruct.swift
//  Reciplease
//
//  Created by Elora on 15/12/2022.
//

import Foundation

struct RecipeStruct: Decodable {
    
    struct RecipeResponse: Decodable {
        
        let label: String
    }
    
    struct HitResponse: Decodable {
        
        let recipe: RecipeResponse
    }
    
    let hits: [HitResponse]
}
