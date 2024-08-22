//
//  RecipeService.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import Foundation

struct RecipeService {
    func getRecipeList(query: String) async -> [RecipeListItem] {
        let apiKey = Bundle.main.infoDictionary?["SPOONACULAR_API_KEY"] as? String
        
        guard apiKey != nil else {
            return [RecipeListItem]()
        }
        
        var urlString = "https://api.spoonacular.com/recipes/complexSearch"
        urlString.append("?query=\(query.addingPercentEncoding(withAllowedCharacters: .whitespaces) ?? "")")
        urlString.append("&number=100")
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(RecipeListResponse.self, from: data)
                
                return response.results
            } catch {
                print("ERROR: \(error)")
            }
        }
        
        
        return [RecipeListItem]()
    }
}
