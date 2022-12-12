//  SearchInteractor.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchInteractor: Interactor
<
	SearchViewModel,
	SearchPresenter
> {
    
    func refresh() {
        self.presenter.display()
    }
}
