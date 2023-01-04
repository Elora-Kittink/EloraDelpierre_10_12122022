//  DetailsViewModel.swift
//
//  Created by Elora on 20/12/2022.
//
import UIKit
import UtilsKit

class DetailsViewModel: ViewModel {
    
//    TODO: est ce qu'on a besoin de isFavorite et de l'ID?
    var recipe: Recipe!
    var image: URL?
    var title: String!
    var time: String!
    var redirection: URL?
    var instructions: [String]!
}
