//
//  RecipeListResponse.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import Foundation

struct RecipeListResponse: Decodable {
    var results: [RecipeListItem]
}
