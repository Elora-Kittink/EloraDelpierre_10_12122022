//  SearchViewController.swift
//
//  Created by Elora on 12/12/2022.
//

import UIKit
import UtilsKit

class SearchViewController: BaseViewController
<
    SearchViewModel,
    SearchPresenter,
    SearchInteractor
> {

    
	
	// MARK: - Outlets
    @IBOutlet private weak var searchTable: UITableView!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    
	// MARK: - Variables
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        searchTable.dataSource = self
        searchTable.delegate = self
        self.searchTable.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        self.searchTable.hideKeyboardOnTap()
        self.textField.layer.cornerRadius = 15
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
        searchTable.reloadData()
	}

	// MARK: - Actions
    @IBAction private func addIngredients() {
        guard let ingredient = self.textField.text
        else { return }
        self.interactor.add(ingredient)
    }
    
    @IBAction private func searchForRecipes() {
        //        bien faire .fromStoryboard() pour créer le viewController lié au storyboard
                let viewController = RecipesListViewController.fromStoryboard()
        //       on passe displayFavorite à False pour que RecipeList affiche la liste de recherche
        //        et pas la liste de favoris
                viewController.displayFavorites = false
                viewController.ingredientsSearch = self.viewModel.ingredientsAdded
//                viewController.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(viewController, animated: true)
    }
}



extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // ici ma vue "your ingredients"
        let view = SearchSectionHeader.fromNib()
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.ingredientsAdded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.ingredientsAdded[indexPath.row]
               
        return cell
    }
}

extension SearchViewController: SearchSectionHeaderDelegate {
    func didTapClear() {
        self.interactor.clear()
    }
}
