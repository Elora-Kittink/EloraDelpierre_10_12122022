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
    @IBOutlet private weak var favoriteButton: UIButton!
	// MARK: - Variables
	
    var recipeId: String!
    
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        recipeInstructionsTableView.delegate = self
        recipeInstructionsTableView.dataSource = self
        self.recipeInstructionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "instructionCell")
        view.backgroundColor = .systemBackground
        
        self.interactor.add(id: recipeId)
	}
    
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
        self.recipeImage.sd_setImage(with: self.viewModel.image,
                                     placeholderImage: UIImage(named: "recipe_placeholder"))
        self.recipeLabel.text = self.viewModel.title
        self.recipeTime.text = self.viewModel.time
        self.favoriteButton.setImage(self.viewModel.favoriteButtonImage, for: .normal)
        recipeInstructionsTableView.reloadData()
	}

	// MARK: - Actions
    @IBAction private func redirection() {
        guard let requestURL = self.viewModel.redirection else {
            return
        }
        UIApplication.shared.open(requestURL)
    }
    
    @IBAction private func isFavorite() {
        self.interactor.addInFavorites(id: recipeId)
    }
}

extension DetailsViewController: StoryboardProtocol {
    static var storyboardName: String {
        "Details"
    }
    
    static var identifier: String? {
        "DetailsViewController"
    }
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.instructions.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel()
        title.text = "Ingredients :"
        title.font = UIFont.boldSystemFont(ofSize: 16)
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "instructionCell", for: indexPath)
       
        cell.textLabel?.text = self.viewModel.instructions[indexPath.row]

        return cell
    }
}
