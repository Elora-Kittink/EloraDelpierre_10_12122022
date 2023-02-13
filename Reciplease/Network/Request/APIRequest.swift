//
//  APIRequest.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation
import NetworkUtilsKit

struct APIRequest: RequestProtocol, MockProtocol {
    
    let ingredients: [String]
    
    var scheme: String {"https"}
    
    var host: String { "api.edamam.com" }
    
    var path: String { "/api/recipes/v2" }
    
    var method: NetworkUtilsKit.RequestMethod { .get }
    
//    TODO: clé api
    var parameters: Parameters? {
        [
            "app_id": Bundle.main.object(forInfoDictionaryKey: "APP_ID") as? String ?? "",
            "app_key": Bundle.main.object(forInfoDictionaryKey: "APP_KEY") as? String ?? "",
            "type": "public",
            "q": self.ingredients.joined(separator: ",")
        ]
    }
    
    var mockFileURL: URL? {
        guard let path = Bundle.main.path(forResource: ProcessInfo.processInfo.environment["mockRecipeResponse"],
                                          ofType: "json")
        else { return nil }
        let url = URL(fileURLWithPath: path)

        return url
    }
}
