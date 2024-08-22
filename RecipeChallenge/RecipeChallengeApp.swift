//
//  RecipeChallengeApp.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import SwiftUI

@main
struct RecipeChallengeApp: App {
    @State var recipeViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(recipeViewModel)
        }
    }
}
