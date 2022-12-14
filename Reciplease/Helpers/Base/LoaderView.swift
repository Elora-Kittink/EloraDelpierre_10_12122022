//  LoaderView.swift
//
//  Created by Elora on 12/12/2022.
//

import UIKit

class LoaderView: UIView {
	
	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		self.setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		self.setup()
	}
	
	func setup() { }
	
	// MARK: - Functions
	func play() {
		self.isHidden = false
	}
	
	func stop() {
		self.isHidden = true
	}
}
