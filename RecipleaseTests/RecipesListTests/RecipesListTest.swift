//
//  RecipesListTest.swift
//  RecipleaseTests
//
//  Created by Elora on 10/01/2023.
//
@testable import Reciplease
import XCTest

final class RecipesListTest: XCTestCase {
    
    func testRecipesListFavorite() async throws {
        RecipesWorker().updateToAddInFavorite(recipeId: "5fca095dad0f25124c4fbc5d800e011b")

        let test = await BaseTest<RecipesListViewModel, RecipesListPresenter, RecipesListInteractor>()
        await test.fire { interactor in
            DispatchQueue.main.async {
                interactor.refresh(ingredients: nil, displayFavorites: true)
            }
        }

        DispatchQueue.main.async {
            XCTAssert(test.viewModel.recipes?.count ?? 0 > 0)
        }
    }
    
    func testRecipesListFetchRecipesSucces() async throws {
        setenv("mockRecipeResponse", "RecipesResponseSucces", 1)
        let test = await BaseTest<RecipesListViewModel, RecipesListPresenter, RecipesListInteractor>()
        
        await test.fire { interactor in
            DispatchQueue.main.async {
                interactor.refresh(ingredients: ["tofu"], displayFavorites: false)
            }
        }
        DispatchQueue.main.async {
            XCTAssert(test.viewModel.recipes?.count ?? 0 > 0)
        }
    }

    func testRecipesListFetchRecipesFail() async throws {
        let test = await BaseTest<RecipesListViewModel, RecipesListPresenter, RecipesListInteractor>()

        setenv("mockRecipeResponse", "RecipesResponseFail", 1)
        
        await test.fire { interactor in
            DispatchQueue.main.async {
                interactor.refresh(ingredients: ["tofu"], displayFavorites: false)
            }
        }
        DispatchQueue.main.async {
            XCTAssert(test.viewModel.recipes?.count ?? 0 == 0)
        }
    }
}
