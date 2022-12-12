//  SearchPresenter.swift
//
//  Created by Elora on 12/12/2022.
//

class SearchPresenter: Presenter<SearchViewModel> {
    
    func display() {
        self.viewModel?.results = []
        self.viewModel?.send()
    }
}
