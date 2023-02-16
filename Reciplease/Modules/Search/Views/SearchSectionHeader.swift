//
//  SearchSectionHeader.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation
import UIKit
import UtilsKit

// delegate qu'on retrouve dans le searchVC
protocol SearchSectionHeaderDelegate: AnyObject {
    func didTapClear()
}

class SearchSectionHeader: UIView, NibProtocol {
    
    @IBOutlet weak var yourIngredientsLabel: UILabel!
    
    weak var delegate: SearchSectionHeaderDelegate?
    
    @IBAction private func clearIngredients() {
        self.delegate?.didTapClear()
    }
}
