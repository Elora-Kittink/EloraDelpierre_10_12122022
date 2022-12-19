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
        let image: String
        let ingredients: [IngredientList]
    }
    
    struct IngredientList: Decodable {
//        let text: String
//        let quantity: Float
//        let measure: String
        let food: String?
//        let foodId: String
//        let image: String
    }
    
    struct HitResponse: Decodable {
        
        let recipe: RecipeResponse
    }
    
    let hits: [HitResponse]
}
