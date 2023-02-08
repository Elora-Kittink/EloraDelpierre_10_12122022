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
            "q": "tofu",
            "app_id": "88a2d686",
            "app_key": "64e25369e87fd7c9e9f9e664b7d4c207",
            "type": "public"
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
