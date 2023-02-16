//  RecipesListViewController.swift
//
//  Created by Elora on 15/12/2022.
//

import UtilsKit
import UIKit


// protocol pour instancier une nouvelle page
// Appelé apr le button search for recipes du SearchVC
extension RecipesListViewController: StoryboardProtocol {
    static var storyboardName: String {
        "Recipes"
    }

    static var identifier: String? {
        "RecipesListViewController"
    }
}

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
//    automatiquement set à true car on ne peut pas le faire depuis la tabBar
//    il passe a false quand le bouton searchForRecipe est appelé puis repassera à
//    true quand on revient sur ce viewcontroller
    var displayFavorites = true
    
    private lazy var emptyLabel: UILabel = {
        var label = UILabel()
        
        if self.displayFavorites {
            label.text = """
                Vous n'avez aucune recette en favoris, pour ajouter une recette en favoris cliquez
                sur le coeur en haut à droite sur la fiche recette
            """
        } else {
            label.text = "Aucune recette trouvée pour cette recherche, essayez autre chose !"
        }
        return label
    }()
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        self.recipeTableView.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.interactor.refresh(ingredients: ingredientsSearch,
                                displayFavorites: displayFavorites)
    }
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
//        si recipes est vide backgroundview = emptylabel  sinon = nil
        recipeTableView.backgroundView = (self.viewModel.recipes?.isEmpty ?? false) ? self.emptyLabel : nil
        recipeTableView.reloadData()
	}
}

    // MARK: TableView

extension RecipesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        min(tableView.frame.height / 1.5, 200)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipes = self.viewModel.recipes else {
            return 0
        }
       return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell
            else { return UITableViewCell() }
//      donne la bonne recette pour remplir les outlets 
//      le "=" notifie et active le didSet de outletFilling dans RecipeCell
        guard let recipes = self.viewModel.recipes else {
            return UITableViewCell()
        }
        cell.outletFilling = recipes[indexPath.row]
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
