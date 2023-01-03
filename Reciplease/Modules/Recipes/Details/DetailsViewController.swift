//  DetailsViewController.swift
//
//  Created by Elora on 20/12/2022.
//
import UtilsKit
import UIKit

class DetailsViewController: BaseViewController
<
	DetailsViewModel,
	DetailsPresenter,
	DetailsInteractor
> {
	
	// MARK: - Outlets
    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var recipeLabel: UILabel!
    @IBOutlet private weak var recipeTime: UILabel!
    @IBOutlet private weak var recipeInstructions: UITableView!
    @IBOutlet private weak var recipeRedirection: UIButton!
	// MARK: - Variables
	
    var recipe: Recipe?
    
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        TODO: c'est pas ça qu'il faut faire
        self.recipeLabel.text = self.recipe?.title
        
	}
	
    
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
	}

//    override func viewDidLayoutSubviews() {
//        <#code#>
//    }
	// MARK: - Actions
    
}

extension DetailsViewController: StoryboardProtocol {
    static var storyboardName: String {
        "Details"
    }
    
    static var identifier: String? {
        "DetailsViewController"
    }
}
