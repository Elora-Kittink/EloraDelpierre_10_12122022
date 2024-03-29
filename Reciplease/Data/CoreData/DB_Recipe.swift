//
//  DB_Recipe.swift
//  Reciplease
//
//  Created by Elora on 21/12/2022.
//

import Foundation
import CoreDataUtilsKit

extension DB_Recipe: CoreDataModel {
    public static var primaryKey: String { "a_id" }
    public static var entityName: String { "DB_Recipe" }
}

extension DB_Recipe {

    static func updateForEach(recipeResponse: [Recipe]) -> [DB_Recipe] {
        var recipesArray: [DB_Recipe] = []
// on créé la recipe dans la BD (recipeSavedInDB) à partir des data que nous a donné le WS (recipeWithDataFromWS)
        recipeResponse.forEach { recipeWithDataFromWS in
            guard let recipeSavedInDB = DB_Recipe.findOrCreate(with: recipeWithDataFromWS.id) else {
                return
            }
            recipeSavedInDB.updateOne(recipe: recipeWithDataFromWS)
            recipesArray.append(recipeSavedInDB)
        }
        return recipesArray
    }

    func updateOne(recipe: Recipe) {
        self.a_title = recipe.title
        self.a_id = recipe.id
        self.a_image = recipe.image?.absoluteString
        self.a_redirection = recipe.redirection?.absoluteString
        self.a_instructions = recipe.instructions.joined(separator: "|")
//      l'attribution de r_ingredient fonctionne aussi dans l'autre sens, l'attribution des recettes à chaque ingrédient
        self.r_ingredient = NSSet(array: DB_Ingredient.updateForEach(recipeResponse: recipe))
    }
}
