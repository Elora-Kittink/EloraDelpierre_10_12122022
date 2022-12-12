//  ViewModel.swift
//
//  Created by Elora on 12/12/2022.
//

import Combine

class ViewModel: ObservableObject {
	
	// MARK: - Variables
	var isLoading: Bool?
	var needToClose = false
    
    // MARK: - Init
    required init() { }
    
    func send() {
        self.objectWillChange.send()
    }
}
