//  SearchPresenter.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchPresenter: Presenter<SearchViewModel> {
    
    func clear() {
        self.viewModel?.ingredientsAdded = []
        self.viewModel?.send()
    }
    
    func display(newIngredients: String) {
// set fusionne les deux tableaux en éliminant les doublons
        let set = Set<String>(self.viewModel?.ingredientsAdded ?? []).union([newIngredients])
        self.viewModel?.ingredientsAdded = Array(set) 
        self.viewModel?.send()
    }
}
