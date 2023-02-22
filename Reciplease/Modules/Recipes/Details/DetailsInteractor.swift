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
    
//      fetch dans la BD la recette à afficher
    func add(id: String) {
        guard let recipe = worker.fetchRecipeFromId(id: id) else {
            return
        }
        self.presenter.display(recipe: recipe)
        self.presenter.display(loader: false)
    }
    
    func addInFavorites(id: String) {
        self.worker.updateToAddInFavorite(recipeId: id)
        guard let recipe = self.worker.fetchRecipeFromId(id: id) else {
            return
        }
        self.presenter.display(recipe: recipe)
        self.presenter.display(loader: false)
    }
}
