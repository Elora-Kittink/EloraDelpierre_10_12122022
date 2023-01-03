//  RecipesListInteractor.swift
//
//  Created by Elora on 15/12/2022.
//

import UtilsKit

class RecipesListInteractor: Interactor
<
    RecipesListViewModel,
    RecipesListPresenter
> {
    private let recipeWorker = RecipesWorker()
//    TODO: commente ça putain !
    func refresh(ingredients: [String]) {
        self.presenter.display(loader: true)
        
        Task {
            do {
                let data = try await recipeWorker.fetchRecipes(ingredients: ingredients)
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
