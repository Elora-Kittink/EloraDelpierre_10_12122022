//
//  RecipesWorker.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation

struct RecipesWorker {
    
    func fetchRecipes(ingredients: [String]) async throws -> [RecipeMainResponse.RecipeResponse] {
        let allData = try await APIRequest(ingredients: ingredients).response(RecipeMainResponse.self)
        
        let allRecipes = allData.hits.map { hit -> RecipeMainResponse.RecipeResponse in
            hit.recipe
        }
        
        return allRecipes
    }
}

struct RecipeMainResponse: Decodable {
    
    struct RecipeResponse: Decodable {
        
        let label: String
    }
    
    struct HitResponse: Decodable {
        
        let recipe: RecipeResponse
    }
    
    let hits: [HitResponse]
}
