//
//  RecipeViewModel.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import Foundation

@Observable
class RecipeViewModel {
    var recipeService = RecipeService()
    
    var recipeList = [RecipeListItem]()
    
    func fetchRecipeList(query: String) async -> Void {
        print("Searching for recipes: \(query)")
        recipeList = await recipeService.getRecipeList(query: query)
        
        print("Got them recipes: \(recipeList)")
    }
}
