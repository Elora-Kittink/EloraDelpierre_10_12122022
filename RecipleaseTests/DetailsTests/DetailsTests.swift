//
//  DetailsTests.swift
//  RecipleaseTests
//
//  Created by Elora on 10/01/2023.
//

import XCTest
@testable import Reciplease

final class DetailsTests: XCTestCase {
    
    func testAdd() async throws {
       let testInteractor = await BaseTest<DetailsViewModel,
                                        DetailsPresenter, DetailsInteractor>()
        await testInteractor.fire { interactor in
            DispatchQueue.main.async {
                interactor.add(id: "5fca095dad0f25124c4fbc5d800e011b")
            }
            DispatchQueue.main.async {
                XCTAssertEqual(testInteractor.viewModel.title, "Tofu Banana Mousse")
            }
        }
    }
    func testAddInFavorites() async throws {
       let testInteractor = await BaseTest<DetailsViewModel,
                                        DetailsPresenter, DetailsInteractor>()
        await testInteractor.fire { interactor in
            DispatchQueue.main.async {
                interactor.addInFavorites(id: "5fca095dad0f25124c4fbc5d800e011b")
            }
            DispatchQueue.main.async {
                XCTAssertEqual(testInteractor.viewModel.title, "Tofu Banana Mousse")
            }
        }
    }
}
