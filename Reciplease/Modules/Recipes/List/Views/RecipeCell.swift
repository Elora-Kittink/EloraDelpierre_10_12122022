//
//  RecipeCell.swift
//  Reciplease
//
//  Created by Elora on 15/12/2022.
//

import Foundation
import UIKit
import UtilsKit

class RecipeCell: UITableViewCell, NibProtocol {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet private weak var likeLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
}
