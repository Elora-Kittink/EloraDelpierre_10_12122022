//  RecipesListPresenter.swift
//
//  Created by Elora on 15/12/2022.
//

import UIKit
import UtilsKit

protocol RecipesListPresentable {
    func display(recipeResponse: [Recipe])
}

class RecipesListPresenter: Presenter<RecipesListViewModel> {
    
    //    fonction qui prends le tableau de RecipeStruct et le transforme en tableau de RecipeCellViewModel
    func display(recipeResponse: [Recipe]) {
        
        let recipesInCellStructForm = recipeResponse
            .map { recipe -> RecipeCellStruct in
                let ingredientsArray = recipe.ingredients.map {
                    $0.name
                }
                let ingredients = ingredientsArray.joined(separator: ", ")
//     initialisation de la structure RecipeCellViewModel avec les données du tableau "ingredients" créé par le compactmap
                
                let date = Calendar.current.date(bySettingHour: 0,
                                                 minute: Int(recipe.time),
                                                 second: 0,
                                                 of: Date())
                
                return RecipeCellStruct(image: recipe.image,
                                        title: recipe.title ?? "Sans titre",
                                        ingredients: ingredients,
                                        time: date?.toString(format: "HH'h'mm") ?? "-",
                                        id: "test")
            }
        //  on pousse au ViewModel le tableau de recette dans la forme affichable
        self.viewModel?.recipes = recipesInCellStructForm
        
        //  on pousse au ViewModel le tableau de recette dans la forme complète pour pouvoir le passer à la fiche Details??
        self.viewModel?.recipesFullInfo = recipeResponse
        
        //  on notifie le model qu'on a fait un changement
        self.viewModel?.send()
    }
}
