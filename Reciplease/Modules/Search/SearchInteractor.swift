//  SearchInteractor.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchInteractor: Interactor
<
	SearchViewModel,
	SearchPresenter
> {
    
    func add(_ ingredient: String) {
        self.presenter.display(newIngredients: ingredient)
        self.presenter.display(loader: false)
    }
    
    func clear() {
        self.presenter.clear()
        self.presenter.display(loader: false)
    }
}
