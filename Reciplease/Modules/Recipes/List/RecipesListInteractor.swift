//  RecipesListInteractor.swift
//
//  Created by Elora on 15/12/2022.
//

import UtilsKit

protocol RecipesListInteractable {
    func refresh(ingredients: [String]?, displayFavorites: Bool)
}

class RecipesListInteractor: Interactor
<
    RecipesListViewModel,
    RecipesListPresenter
> , RecipesListInteractable {
    private let recipeWorker = RecipesWorker()
    
    
    // Appel le worker, si c'est pour afficher la liste des favoris, alors on appelle fetchFavorites
    //    si c'est pour afficher les résultats d'une recherche par ingrédients on appelle fetchRecipes
    func refresh(ingredients: [String]?, displayFavorites: Bool) {
        if displayFavorites {
            Task {
                let data = recipeWorker.fetchFavorites()
                    self.presenter.display(recipeResponse: data)
            }
        } else {
            self.presenter.display(loader: true)
            Task {
                do {
                    let data = try await recipeWorker.fetchRecipes(ingredients: ingredients ?? [])
                    self.presenter.display(recipeResponse: data)
                } catch {
                    //                ** log() from utilsKit
                    log(.data, "RecipesListInteractor", error: error)
                    self.presenter.display(recipeResponse: [])
                }
                self.presenter.display(loader: false)
            }
        }
    }
}
