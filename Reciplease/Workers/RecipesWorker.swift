//
//  RecipesWorker.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation
import CoreDataUtilsKit



// Une struct au lieu d'une class car pas besoin de garder une référence mémoire forte
struct RecipesWorker {
    
//    Fetch all recipes from API
    func fetchRecipes(ingredients: [String]) async throws -> [Recipe] {
        let allData: RecipeResponse
        
        if ProcessInfo.processInfo.environment["isTestsRunning"] == "true" {
            allData = try await APIRequest(ingredients: []).mock(RecipeResponse.self)
        } else {
            allData = try await APIRequest(ingredients: ingredients).response(RecipeResponse.self)
        }
        
//        on transforme la réponse (au format struc de l'api) en tableau de notre format struc universelle
        let allRecipes = allData.hits.map { hit -> Recipe in
            Recipe(from: hit)
        }
        
        DB_Recipe.updateForEach(recipeResponse: allRecipes)
        try CoreDataManager.default.save()
        
        return allRecipes
    }
    
//    Fetch in DB with id for detail view
    func fetchRecipeFromId(id: String) -> Recipe? {
        guard let DBRecipe = DB_Recipe.get(with: id) else {
            return nil
        }
        return Recipe(from: DBRecipe)
    }
    
//   récupère dans la DB en filtrant les recipes où isFavorite = true pour la vue recipeList des favoris
    func fetchFavorites() -> [Recipe] {
        let predicate = NSPredicate(format: "a_isFavorite == TRUE")
        let fetchRequest = DB_Recipe.getAll(predicate: predicate)
        let favoriteRecipes = fetchRequest.map { recipe in
            Recipe(from: recipe)
        }
        return favoriteRecipes
    }
    
//    Ajoute ou supprime une recette des favoris
//    récupère une recipe avec son id, toggle la valeur de son attribut, et sauvegarde cette modif
    func updateToAddInFavorite(recipeId: String) {
        guard let recipe = DB_Recipe.get(with: recipeId) else { return }
        recipe.a_isFavorite.toggle()
        try? CoreDataManager.default.save()
    }
}
