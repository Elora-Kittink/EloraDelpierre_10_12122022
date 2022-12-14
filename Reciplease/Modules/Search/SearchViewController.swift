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
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
	// MARK: - Variables
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        searchTable.dataSource = self
        searchTable.delegate = self
        
        Task {
            let data = try? await RecipesWorker().fetchRecipes(ingredients: ["milk"])
            log(.data, data)
        }
        
        self.interactor.refresh()
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
	}

	// MARK: - Actions
    
    @IBAction private func searchForRecipes() {
        
    }


}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // ici ma vue "your ingredients"
        let view = SearchSectionHeader.fromNib()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "TEST section \(indexPath.section), row \(indexPath.row)"
        return cell
    }
}

extension SearchViewController: SearchSectionHeaderDelegate {
    func didTapClear() {
        // vider les ingrédients choisis
        // est ce que ça devrait pas plutot etre dans l'interactor ou le presenter? 
    }
    
    
}
