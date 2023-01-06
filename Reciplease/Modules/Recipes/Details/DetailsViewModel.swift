//  DetailsViewModel.swift
//
//  Created by Elora on 20/12/2022.
//
import UIKit
import UtilsKit

class DetailsViewModel: ViewModel {
    
    var recipe: Recipe!
    var image: URL?
    var title: String!
    var time: String!
    var redirection: URL?
    var instructions: [String]!
    var favoriteButtonImage: UIImage!
}
