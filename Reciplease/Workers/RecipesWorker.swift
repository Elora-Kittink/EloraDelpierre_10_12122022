//
//  RecipesWorker.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation

struct RecipesWorker {
    
    func fetchRecipes(ingredients: [String]) async throws -> [Recipe] {
        let allData = try await APIRequest(ingredients: ingredients).response(RecipeResponse.self)
        
        let allRecipes = allData.hits.map { hit -> Recipe in
            Recipe(from: hit)
        }
        
        return allRecipes
    }
}
