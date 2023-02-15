//  DetailsPresenter.swift
//
//  Created by Elora on 20/12/2022.
//

import UIKit
import SDWebImage

class DetailsPresenter: Presenter<DetailsViewModel> {
    
//    Remplissage des données du ViewModel
    func display(recipe: Recipe) {
        
        let duration = Int(recipe.time)
        
        self.viewModel?.recipe = recipe
        self.viewModel?.image = recipe.image
        self.viewModel?.title = recipe.title
        self.viewModel?.redirection = recipe.redirection
        self.viewModel?.instructions = recipe.instructions
        self.viewModel?.time = " \(duration) minutes"
        if recipe.isFavorite {
            self.viewModel?.favoriteButtonImage = UIImage(systemName: "heart.fill")
            self.viewModel?.favoriteAccessibilityValue = "recipe in favorites"
        } else {
            self.viewModel?.favoriteButtonImage = UIImage(systemName: "heart")
            self.viewModel?.favoriteAccessibilityValue = "recipe not in favorites"
        }
        self.viewModel?.send()
    }
}
