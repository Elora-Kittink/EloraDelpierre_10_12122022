//  RecipesListPresenter.swift
//
//  Created by Elora on 15/12/2022.
//

import UIKit
import UtilsKit

class RecipesListPresenter: Presenter<RecipesListViewModel> {
    
//    fonction qui prends le tableau de RecipeStruct et le transforme en tableau de RecipeCellViewModel
    func display(recipeResponse: [RecipeStruct.RecipeResponse]) {
//        TODO: - réécrire un peu plus lisible
        self.viewModel?.recipes = recipeResponse
            .map { recipe -> RecipeCellStruct in
                let ingredients = recipe
                    .ingredients
                    .compactMap { ingredient -> String? in
                        ingredient.food
                    }
                    .joined(separator: ", ")
//     initialisation de la structure RecipeCellViewModel avec les données du tableau "ingredients" créé par le compactmap
                return RecipeCellStruct(image: URL(recipe.image), 
                                    title: recipe.label,
                                    ingredients: ingredients,
                                    nbLikes: "0",
                                    time: "0h")
            }
        
        debug(self.viewModel?.recipes.count)
        self.viewModel?.send()
    }
}
