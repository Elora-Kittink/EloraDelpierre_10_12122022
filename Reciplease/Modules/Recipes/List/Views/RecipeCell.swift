//
//  RecipeCell.swift
//  Reciplease
//
//  Created by Elora on 15/12/2022.
//

import Foundation
import UIKit
import UtilsKit

class RecipeCell: UIView, NibProtocol {
    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var likeLabel: UILabel!

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var recipeLabel: UILabel!
    @IBOutlet private weak var ingredientsLabel: UILabel!
}
