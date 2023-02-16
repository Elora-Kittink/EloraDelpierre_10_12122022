//
//  RecipeCell.swift
//  Reciplease
//
//  Created by Elora on 15/12/2022.
//

import Foundation
import UIKit
import UtilsKit
import SDWebImage

class RecipeCell: UITableViewCell, NibProtocol {
    
    @IBOutlet private weak var recipeImage: UIImageView! {
        didSet {
            self.recipeImage.setCornerRadius(8)
        }
    }
    @IBOutlet private weak var timeView: UIView! {
        didSet {
            self.timeView.setCornerRadius(8, edges: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            let gradient = CAGradientLayer()
            gradient.colors = [UIColor.clear.cgColor, UIColor.gray.cgColor]
            gradient.frame = self.timeView.bounds
            self.timeView.layer.insertSublayer(gradient, at: 0)
        }
    }
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var recipeLabel: UILabel!
    @IBOutlet private weak var ingredientsLabel: UILabel!
    
    var outletFilling: RecipeCellStruct! {
        didSet {
            self.recipeImage.sd_setImage(with: self.outletFilling.image, placeholderImage: UIImage(named: "recipe_placeholder"))
            self.timeLabel.text = self.outletFilling.time
            self.recipeLabel.text = self.outletFilling.title
            self.ingredientsLabel.text = self.outletFilling.ingredients
//    Mark: accessibility
            self.recipeImage.isAccessibilityElement = true
            self.recipeImage.accessibilityTraits = .image
            guard let recipeLabelText = self.recipeLabel.text else {
                return
            }
            self.recipeImage.accessibilityValue = "\(recipeLabelText) image"
            
            self.recipeLabel.isAccessibilityElement = true
            self.recipeLabel.accessibilityTraits = .staticText
            
            self.timeLabel.isAccessibilityElement = true
            self.timeLabel.accessibilityTraits = .staticText
            
            self.ingredientsLabel.isAccessibilityElement = true
            self.ingredientsLabel.accessibilityTraits = .staticText
        }
    }
}
