//  Interactor.swift
//
//  Created by Elora on 12/12/2022.
//

import Foundation

@MainActor class Interactor<V: ViewModel, P: Presenter<V>> {
	
	// MARK: - Variables
	let presenter: P
	
	// MARK: - Init
	required init() {
		self.presenter = P()
	}
	
	func set(viewModel: V) {
		self.presenter.set(viewModel: viewModel)
	}
}
