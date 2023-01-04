//
//  RecipesWorker.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation
import CoreDataUtilsKit

struct RecipesWorker {
    
    func fetchRecipes(ingredients: [String]) async throws -> [Recipe] {
        let allData = try await APIRequest(ingredients: ingredients).response(RecipeResponse.self)
//        on transforme la réponse (au format struc de l'api) en tableau de notre format struc universelle
        let allRecipes = allData.hits.map { hit -> Recipe in
            Recipe(from: hit)
        }
        
        DB_Recipe.updateForEach(recipeResponse: allRecipes)
        try CoreDataManager.default.save()
        
        print(DB_Ingredient.getAll())
        return allRecipes
    }
    
    func fetchRecipeFromId(id: String) -> Recipe? {
        guard let DBRecipe = DB_Recipe.get(with: id) else {
            return nil
        }
        return Recipe(from: DBRecipe)
    }
}
