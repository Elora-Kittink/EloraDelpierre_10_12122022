//  DetailsViewController.swift
//
//  Created by Elora on 20/12/2022.
//
import UtilsKit
import UIKit
import SDWebImage

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
    @IBOutlet private weak var recipeInstructionsTableView: UITableView!
    @IBOutlet private weak var recipeRedirection: UIButton!
	// MARK: - Variables
	
    var recipeId: String!
    
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .systemBackground
        refreshUI()
        self.interactor.add(id: recipeId)
	}
    
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
        self.recipeImage.sd_setImage(with: self.viewModel.image,
                                     placeholderImage: UIImage(named: "recipe_placeholder"))
        self.recipeLabel.text = self.viewModel.title
        self.recipeTime.text = self.viewModel.time
	}

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
