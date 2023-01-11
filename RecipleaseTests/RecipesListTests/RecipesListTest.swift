//
//  RecipesListTest.swift
//  RecipleaseTests
//
//  Created by Elora on 10/01/2023.
//
@testable import Reciplease
import XCTest

// pour tester si une fonction est appellée
class PresenterSpy: RecipesListPresentable {
    var isDisplayFunctionCalled = false
    var recipes: [Recipe]?
    
    func display(recipeResponse: [Recipe]) {
        isDisplayFunctionCalled = true
        self.recipes = recipeResponse
    }
}

// pour tester si une fonction est appellée
struct WorkerSpy: RecipesDataProviding {
    var recipesArray: [Recipe]?
    var recipeFromId: Recipe?
    
    var isFetchRecipesCalled = false
    var isFetchRecipeFromIdCalled = false
    var isFetcheFavoritesCalled = false
    var isUpdateToAddInFavoriteCalled = false
    
    func fetchRecipes(ingredients: [String]) {
        isFetchRecipesCalled = true
    }
    func fetchRecipeFromId(id: String) -> Recipe? {
        isFetchRecipeFromIdCalled = true
    }
    func fetchFavorites() -> [Recipe] {
        isFetcheFavoritesCalled = true
    }
    func updateToAddInFavorite(recipeId: String) {
        isUpdateToAddInFavoriteCalled = true
    }
}

final class RecipesListTest: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    func testInteractorFetchRecipesWorker() {
//        Given
        let workerSpy = WorkerSpy()
        let SUT = RecipesListInteractor()
    }

}
