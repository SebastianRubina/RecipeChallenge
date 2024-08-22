//
//  RecipeListItem.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import Foundation

struct RecipeListItem: Decodable, Identifiable {
    var id: Int
    var title: String
    var image: String
}
