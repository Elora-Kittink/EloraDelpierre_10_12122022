//  RecipesListPresenter.swift
//
//  Created by Elora on 15/12/2022.
//



class RecipesListPresenter: Presenter<RecipesListViewModel> {
    
    func display(recipeResponse: [RecipeStruct.RecipeResponse]) {
        self.viewModel?.recipes = recipeResponse
        self.viewModel?.send()
        print(self.viewModel?.recipes)
    }
}
