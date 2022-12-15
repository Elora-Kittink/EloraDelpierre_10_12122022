//  RecipesListViewController.swift
//
//  Created by Elora on 15/12/2022.
//

import UtilsKit

class RecipesListViewController: BaseViewController
<
	RecipesListViewModel,
	RecipesListPresenter,
	RecipesListInteractor
> {
	
	// MARK: - Outlets
	
	// MARK: - Variables
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
	}

	// MARK: - Actions
}

extension RecipesListViewController: StoryboardProtocol {
    static var storyboardName: String {
        "Recipes"
    }
    
    static var identifier: String? {
        "RecipesListViewController"
    }
}
