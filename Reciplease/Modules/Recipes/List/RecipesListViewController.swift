//  RecipesListViewController.swift
//
//  Created by Elora on 15/12/2022.
//

import UtilsKit
import UIKit

class RecipesListViewController: BaseViewController
<
	RecipesListViewModel,
	RecipesListPresenter,
	RecipesListInteractor
> {
	
	// MARK: - Outlets
    @IBOutlet private weak var recipeTableView: UITableView!
    
	// MARK: - Variables
    var ingredientsSearch: [String]?
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        self.recipeTableView.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        self.interactor.refresh(ingredients: ingredientsSearch ?? [])
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
        recipeTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        min(tableView.frame.height / 4.5, 200)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell
        else { return UITableViewCell() }
//      donne la bonne recette pour remplir les outlets 
//      le "=" notifie et active le didSet de outletFilling dans RecipeCell
        cell.outletFilling = self.viewModel.recipes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipeId = self.viewModel.recipesFullInfo[indexPath.row].id else {
            return
        }
        let vc = DetailsViewController.fromStoryboard()
        vc.recipeId = recipeId
        navigationController?.pushViewController(vc, animated: true)
    }
}
