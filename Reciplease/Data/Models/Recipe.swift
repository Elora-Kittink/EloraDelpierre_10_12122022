//
//  Recipe.swift
//  Reciplease
//
//  Created by Elora on 22/12/2022.
//

import Foundation

// structure universelle qui peut être obtenue
//soit depuis la structure réponse de l'api,
//soit par la structure de la base de donnée

struct Recipe {
    
    private(set) var image: URL?
    private(set) var title: String?
    private(set) var ingredients: [(name: String, id: String)]
    private(set) var time: Double
    private(set) var id: String?
    private(set) var redirection: URL?
    private(set) var isFavorite: Bool
    private(set) var instructions: [String]
    
// si on traduit depuis l'api
    init(from response: RecipeResponse.HitResponse) {
        self.image = URL(response.recipe.image)
        self.title = response.recipe.label
//        est ce que ici il faut pas que je fasse un tableau de tupples pour avoir le nom de l'ingrédient ET son id
        self.ingredients = response.recipe.ingredients.compactMap { ingredient -> (name: String, id: String) in
            (name: ingredient.food, id: ingredient.foodId)
        }
        self.time = response.recipe.totalTime
        self.id = URL(response._links.`self`.href)?.lastPathComponent
        self.redirection = URL(response.recipe.uri)
        self.isFavorite = false
        self.instructions = response.recipe.ingredientLines
    }
    
//    si on traduit depuis la base de donnée 
    init(from coreDataObject: DB_Recipe) {
        self.image = URL(coreDataObject.a_image)
        self.title = coreDataObject.a_title
//       on fait un compactmap pour extraire name et id du NSObject
        self.ingredients = (coreDataObject.r_ingredient?.allObjects as? [DB_Ingredient])?.compactMap {
            guard let name = $0.a_name, let id = $0.a_id else { return nil }
            return (name, id)
        } ?? []
        self.time = coreDataObject.a_time
        self.id = coreDataObject.a_id
        self.redirection = URL(coreDataObject.a_redirection)
        self.isFavorite = coreDataObject.a_isFavorite
        self.instructions = coreDataObject.a_instructions?.components(separatedBy: "|") ?? []
    }
}
