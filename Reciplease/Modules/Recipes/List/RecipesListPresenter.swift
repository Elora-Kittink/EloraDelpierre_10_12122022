//  RecipesListPresenter.swift
//
//  Created by Elora on 15/12/2022.
//

import UIKit
import UtilsKit

class RecipesListPresenter: Presenter<RecipesListViewModel> {
    
    //    fonction qui prends le tableau de RecipeStruct et le transforme en tableau de RecipeCellViewModel
    func display(recipeResponse: [RecipeResponse.Recipe]) {

        let recipesInCellStructForm = recipeResponse
            .map { recipe -> RecipeCellStruct in
                let ingredients = recipe
                    .ingredients
                    .compactMap { ingredient -> String? in
                        ingredient.food
                    }
                    .joined(separator: ", ")
                
                //     initialisation de la structure RecipeCellViewModel avec les données du tableau "ingredients" créé par le compactmap
                //        TODO: - transformer totalTime en lisible : totalTime = temps en minutes
                //        TODO: - trouver les likes dans la réponse API
                let date = Calendar.current.date(bySettingHour: 0,
                                                 minute: Int(recipe.totalTime),
                                                 second: 0,
                                                 of: Date())
// TODO: Problème : recipe est une RecipeStruct.RecipeResponse alors que le href dont j'ai besoin pour faire mon URL est dans RecipeStruct.HitResponse. RELOU
                
                return RecipeCellStruct(image: URL(recipe.image),
                                        title: recipe.label,
                                        ingredients: ingredients,
                                        nbLikes: "\(recipe.yield)",
                                        time: date?.toString(format: "HH'h'mm") ?? "-", id: "test")
            }
//  on pousse au ViewModel le tableau de recette dans la forme affichable
        self.viewModel?.recipes = recipesInCellStructForm
//  on notifie le model qu'on a fait un changement
        self.viewModel?.send()
    }
}
