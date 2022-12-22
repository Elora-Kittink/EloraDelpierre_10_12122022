//
//  DB_Ingredient.swift
//  Reciplease
//
//  Created by Elora on 22/12/2022.
//

import Foundation
import CoreDataUtilsKit

extension DB_Ingredient {
    public static var primaryKey: String { "a_id" }
    public static var entityName: String { "DB_Ingredient" }
}

extension DB_Ingredient {
//    TODO: qui appelle ça déjà? Le recipeResponse en paramettre il vient d'ou? c'est lequel?
    static func update(recipeResponse: [RecipeResponse.HitResponse]) {
        recipeResponse.compactMap { recipe in
//            let recipe = DB_Ingredient.findOrCreate(with: recipe.recipe.ingredients)

        }
    }

    func update2(){
//        self.a_id = ingredient.id
//        self.a_name = ingredient.name
    }
}
