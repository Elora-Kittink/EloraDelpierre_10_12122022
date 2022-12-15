//
//  APIRequest.swift
//  Reciplease
//
//  Created by Elora on 14/12/2022.
//

import Foundation
import NetworkUtilsKit

struct APIRequest: RequestProtocol {
    
    let ingredients: [String]
    
    var scheme: String {"https"}
    
    var host: String { "api.edamam.com" }
    
    var path: String { "/api/recipes/v2" }
    
    var method: NetworkUtilsKit.RequestMethod { .get }
    
    var parameters: Parameters? {
        [
            "q": self.ingredients.joined(separator: ","),
            "app_id": "88a2d686",
            "app_key": "64e25369e87fd7c9e9f9e664b7d4c207",
            "type": "public"
        ]
    }
}
