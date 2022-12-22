//
//  RecipeStruct.swift
//  Reciplease
//
//  Created by Elora on 15/12/2022.
//

import Foundation

struct RecipeResponse: Decodable {
    
    struct Recipe: Decodable {
        
        let label: String
        let image: String
        let ingredients: [IngredientList]
        let ingredientLines: [String]
        let totalTime: Double
        let uri: String
    }
    
    struct IngredientList: Decodable {

        let food: String?
        let foodId: String
    }
    
    struct HitResponse: Decodable {
        
        let recipe: Recipe
        let _links: Links
    }
    
    struct Links: Decodable {
        let `self`: Selfs
    }
    
    struct Selfs: Decodable {
        let href: String
    }
    
    let hits: [HitResponse]
}
