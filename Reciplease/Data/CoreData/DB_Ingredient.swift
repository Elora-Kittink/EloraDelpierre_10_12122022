//
//  DB_Ingredient.swift
//  Reciplease
//
//  Created by Elora on 22/12/2022.
//

import Foundation
import CoreDataUtilsKit

extension DB_Ingredient: CoreDataModel {
    public static var primaryKey: String { "a_id" }
    public static var entityName: String { "DB_Ingredient" }
}

extension DB_Ingredient {
    
    static func updateForEach(recipeResponse: Recipe) -> [DB_Ingredient] {
        return recipeResponse.ingredients.compactMap { ingredient in
            guard let ingredientSavedInDB = DB_Ingredient.findOrCreate(with: ingredient.id)
            else {
                return nil
            }
            
            ingredientSavedInDB.updateOne(ingredient: ingredient, for: recipeResponse)
            
            return ingredientSavedInDB
        }
    }
    
    func updateOne(ingredient: (name: String, id: String), for recipe: Recipe) {
        self.a_id = ingredient.id
        self.a_name = ingredient.name
//        TODO: ajouter la relation avec Recipe
//        self.r_recipe = NSSet(array: DB_Recipe.updateForEach(recipeResponse: []))
       
    }
}
