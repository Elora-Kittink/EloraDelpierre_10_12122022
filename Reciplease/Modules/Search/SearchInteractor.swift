//  SearchInteractor.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchInteractor: Interactor
<
	SearchViewModel,
	SearchPresenter
> {
// loader: false pour le fonctionnment des tests unitaires
    func add(_ ingredient: String) {
        self.presenter.display(newIngredients: ingredient)
        self.presenter.display(loader: false)
    }
    
    func clear() {
        self.presenter.clear()
        self.presenter.display(loader: false)
    }
}
