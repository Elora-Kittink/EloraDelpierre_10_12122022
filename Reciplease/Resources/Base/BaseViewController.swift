//  BaseViewController.swift
//
//  Created by Elora on 12/12/2022.
//

import Foundation
import UIKit
import Combine

class BaseViewController
<
	V: ViewModel,
	P: Presenter<V>,
	I: Interactor<V, P>
>:
	UIViewController {
	
	// MARK: - Variables
	
	// MARK: Clean Archi
	var viewModel = V() {
		didSet {
			self.configureViewModel(for: &self.interactor)
		}
	}
	
	lazy var interactor: I = {
		var interactor = I()
		
		self.configureViewModel(for: &interactor)
		
		return interactor
	}()
	
	private var subscribers = Set<AnyCancellable>()
	
	// MARK: - View life cycle
	deinit {
		self.stopLoading()
		NotificationCenter.default.removeObserver(self)
		print("💀 Deinit \(String(describing: self))")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .systemGray
        itemAppearance.selected.iconColor = UIColor(named: "myOrange")
        let appearance = UITabBarAppearance()
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor.systemBackground
        appearance.stackedLayoutAppearance = itemAppearance
        tabBarController?.tabBar.standardAppearance.backgroundColor = UIColor.systemBackground
        tabBarController?.tabBar.standardAppearance = appearance

        if #available(iOS 15.0, *) {
            tabBarController?.tabBar.standardAppearance = appearance
        }
        
        guard let items = tabBarController?.tabBar.items else { return }
        items.first?.accessibilityValue = "Search page"
        items.last?.accessibilityValue = "Favorites page"
    }
    
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.stopLoading()
	}
	
	// MARK: - Configure viewModel
	private func configureViewModel(for interactor: inout I) {
		self.subscribers.removeAll()
		
		self.viewModel
			.objectWillChange
			.receive(on: DispatchQueue.main)
			.sink { [weak self] _ in
				self?.refreshUI()
			}
			.store(in: &self.subscribers)
		
		interactor.set(viewModel: self.viewModel)
	}
	
	// MARK: - Refresh
	func refreshUI() {
        guard !self.viewModel.needToClose else {
            self.viewModel.needToClose = false
            self.dismiss(animated: true)
            return
        }
		
		if let isLoading = self.viewModel.isLoading {
			if isLoading {
				self.startLoading()
			} else {
				self.stopLoading()
			}
			
			self.viewModel.isLoading = nil
		}
	}

	// MARK: - Loading
	func startLoading() {
		self.display(loader: true)
	}
	
	func stopLoading() {
		self.display(loader: false)
	}
}

private extension UIViewController {
	
	func display(loader: Bool) {
		let tag = self.hashValue
		
		if loader {
			let loaderView = LoaderView()
			loaderView.tag = tag
			loaderView.play()
			
			self.view.addSubview(loaderView)
			loaderView.translatesAutoresizingMaskIntoConstraints = false
			
			NSLayoutConstraint.activate([
				loaderView.topAnchor.constraint(equalTo: self.view.topAnchor),
				loaderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
				loaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
				loaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
			])
		} else {
			guard let loaderView = self.view?.viewWithTag(tag) as? LoaderView
			else { return }
			
			loaderView.stop()
			loaderView.removeFromSuperview()
		}
	}
}
