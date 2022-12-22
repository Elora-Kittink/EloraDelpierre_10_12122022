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

    static func update(recipeResponse: [RecipeResponse.HitResponse]) {

        recipeResponse.compactMap { recipe in
            let recipe = DB_Recipe.findOrCreate(with: recipe._links.`self`.href)

        }
    }

    func update2(recipe: RecipeResponse) {
//        self.a_title = recipe.
//        self.a_id =
//        self.a_image =
//        self.a_redirection =
//        self.a_instructions =
    }
}
// pour trouver l'id creer URL avec le href dans links, et utiliser les passcomponent pour prendre le dernier param
//let url = URL("https://api.edamam.com/api/recipes/v2/5fca095dad0f25124c4fbc5d800e011b?type=public&app_id=88a2d686&app_key=64e25369e87fd7c9e9f9e664b7d4c207")
//debug(url?.lastPathComponent)

