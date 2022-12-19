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
    
    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var likeLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var recipeLabel: UILabel!
    @IBOutlet private weak var ingredientsLabel: UILabel!
    
//    
    var outletFilling: RecipeCellStruct! {
        didSet {
            self.recipeImage.image = self.outletFilling.image
            self.likeLabel.text = self.outletFilling.nbLikes
            self.timeLabel.text = self.outletFilling.time
            self.recipeLabel.text = self.outletFilling.title
            self.ingredientsLabel.text = self.outletFilling.ingredients
        }
    }
}
