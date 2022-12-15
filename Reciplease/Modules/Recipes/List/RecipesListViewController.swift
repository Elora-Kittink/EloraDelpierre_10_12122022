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
    @IBOutlet private weak var recipeTableView: UITableView!
    
	// MARK: - Variables
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        self.recipeTableView.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
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

extension RecipesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = recipeTableView.deq
    }
    
    
}
