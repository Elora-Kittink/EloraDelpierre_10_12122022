//  DetailsPresenter.swift
//
//  Created by Elora on 20/12/2022.
//

import UIKit
import SDWebImage

class DetailsPresenter: Presenter<DetailsViewModel> {
    
    //    TODO: est ce qu'on a besoin de Clear()?
    //    func clear() {
    //        self.viewModel?.recipe = Recipe
    //    }
    
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
        self.viewModel?.send()
    }
}
