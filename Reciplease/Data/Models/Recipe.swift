//
//  Recipe.swift
//  Reciplease
//
//  Created by Elora on 22/12/2022.
//

import Foundation

struct Recipe {
    
    private(set) var image: URL?
    private(set) var title: String?
    private(set) var ingredients: [String]
    private(set) var time: Double
    private(set) var id: String?
    private(set) var redirection: URL?
    private(set) var isFavorite: Bool
    private(set) var instructions: [String]
    
    init(from response: RecipeResponse.HitResponse) {
        self.image = URL(response.recipe.image)
        self.title = response.recipe.label
        self.ingredients = response.recipe.ingredients.compactMap { ingredient -> String? in
            ingredient.food
        }
        self.time = response.recipe.totalTime
        self.id = URL(response._links.`self`.href)?.lastPathComponent
        self.redirection = URL(response.recipe.uri)
        self.isFavorite = false
        self.instructions = response.recipe.ingredientLines
    }
    
    init(from coreDataObject: DB_Recipe) {
        self.image = URL(coreDataObject.a_image)
        self.title = coreDataObject.a_title
//         TODO: voir les relations à ingredients
        self.ingredients = []
        self.time = coreDataObject.a_time
        self.id = coreDataObject.a_id
        self.redirection = URL(coreDataObject.a_redirection)
        self.isFavorite = coreDataObject.a_isFavorite
        self.instructions = coreDataObject.a_instructions?.components(separatedBy: "|") ?? []
    }
}
