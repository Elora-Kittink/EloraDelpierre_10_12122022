//  SearchViewController.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchViewController: BaseViewController
<
	SearchViewModel,
	SearchPresenter,
	SearchInteractor
> {
	
	// MARK: - Outlets
	
	// MARK: - Variables
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.interactor.refresh()
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
	}

	// MARK: - Actions
}
