//
//  RecipesWorker.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation

struct RecipesWorker {
    
    func fetchRecipes(ingredients: [String]) async throws -> [RecipeStruct.RecipeResponse] {
        let allData = try await APIRequest(ingredients: ingredients).response(RecipeStruct.self)
        
        let allRecipes = allData.hits.map { hit -> RecipeStruct.RecipeResponse in
            hit.recipe
        }
        
        return allRecipes
    }
}
