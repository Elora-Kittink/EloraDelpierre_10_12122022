//  DetailsPresenter.swift
//
//  Created by Elora on 20/12/2022.
//

import UIKit
import SDWebImage


// TODO: faire correspondre le remplissage des coeurs avec favors ou non 
class DetailsPresenter: Presenter<DetailsViewModel> {
    
//    Remplissage des données du ViewModel
    func display(recipe: Recipe) {
        
        let date = Calendar.current.date(bySettingHour: 0,
                                         minute: Int(recipe.time),
                                         second: 0,
                                         of: Date())
        
        self.viewModel?.recipe = recipe
        self.viewModel?.image = recipe.image
        self.viewModel?.title = recipe.title
        self.viewModel?.redirection = recipe.redirection
        self.viewModel?.instructions = recipe.instructions
        self.viewModel?.time = date?.toString(format: "HH'h'mm") ?? "-"
        if recipe.isFavorite {
            self.viewModel?.favoriteButtonImage = UIImage(systemName: "heart.fill")
        } else {
            self.viewModel?.favoriteButtonImage = UIImage(systemName: "heart")
        }
        self.viewModel?.send()
    }
}
