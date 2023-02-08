//
//  SearchTests.swift
//  RecipleaseTests
//
//  Created by Elora on 10/01/2023.
//

import XCTest
@testable import Reciplease

final class SearchTests: XCTestCase {
    
    func testAdd() async throws {
        let test = await BaseTest<SearchViewModel, SearchPresenter, SearchInteractor>()
        await test.fire { interactor in
            DispatchQueue.main.async {
                interactor.add("tofu")
            }
        }
        DispatchQueue.main.async {
            XCTAssertTrue(test.viewModel.ingredientsAdded.contains("tofu"))
        }
    }
    
    func testClear() async throws {
        let test = await BaseTest<SearchViewModel, SearchPresenter, SearchInteractor>()
       await test.fire { interactor in
            DispatchQueue.main.async {
                interactor.clear()
            }
        }
        DispatchQueue.main.async {
            XCTAssertTrue(test.viewModel.ingredientsAdded.isEmpty)
        }
    }
}
