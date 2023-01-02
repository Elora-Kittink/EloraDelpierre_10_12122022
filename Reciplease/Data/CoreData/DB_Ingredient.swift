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

//extension DB_Ingredient {
//    // on créé  ingredient dans la BD (IngredientSavedInDB) à partir des data que nous a donné le WS (recipeWithDataFromWS)
//    static func updateForEach(recipeResponse: [Recipe]) {
//        recipeResponse.forEach { recipeWithDataFromWS in
//            let ingredientSavedInDB = DB_Ingredient.findOrCreate(with: recipeWithDataFromWS.id)
//            ingredientSavedInDB?.updateOne(recipe: recipeWithDataFromWS)
//        }
//    }
//
//    func updateOne(recipe: Recipe) {
//        self.a_id = recipe.id
//        self.a_name = recipe.ingredients.food
//    }
//}

extension DB_Ingredient {
    
    static func updateForEach2(recipeResponse: [Recipe]) {
        recipeResponse.forEach { recipeWithDataFromWS in
            recipeWithDataFromWS.ingredients.forEach { ingredient in
                let ingredientSavedInDB = DB_Ingredient.findOrCreate(with: recipeWithDataFromWS.id)
                ingredientSavedInDB?.updateOne2(ingredient: ingredient)
            }
        }
    }
    
    func updateOne2(ingredient: (name: String, id: String)) {
        self.a_id = ingredient.id
        self.a_name = ingredient.name
    }
}
