//  DetailsInteractor.swift
//
//  Created by Elora on 20/12/2022.
//
import CoreDataUtilsKit
import Foundation

class DetailsInteractor: Interactor
<
	DetailsViewModel,
	DetailsPresenter
> {
    let worker = RecipesWorker()
    
    func add(id: String) {
        guard let recipe = worker.fetchRecipeFromId(id: id) else {
            return
        }
        self.presenter.display(recipe: recipe)
    }
    
    func addInFavorites(id: String) {
        self.worker.updateToAddInFavorite(recipeId: id)
    }
}
