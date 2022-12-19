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
        300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell {
//            cell.recipeLabel.text = self.viewModel.recipes[indexPath.row].label
//            var ingredientsArray: [String] = []
//            self.viewModel.recipes[indexPath.row].ingredients.forEach { ingredient in
//                guard let ingredient = ingredient.food else {
//                    return
//                }
//                ingredientsArray.append(ingredient)
//            }
//            cell.ingredientsLabel.text = ingredientsArray.joined(separator: ", ")
//            return cell
//        }
//
//        return UITableViewCell()
        
        guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell
        else { return UITableViewCell() }
//      donne la bonne recette pour remplir les outlets 
//      le "=" notifie et active le didSet de outletFilling dans RecipeCell
        cell.outletFilling  = self.viewModel.recipes[indexPath.row]
        
        return cell
    }
}
