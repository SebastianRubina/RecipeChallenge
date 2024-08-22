//
//  ContentView.swift
//  RecipeChallenge
//
//  Created by Sebastián Rubina on 2024-08-21.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipeViewModel.self) var recipeViewModel
    
    @State var query = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Search for an item...", text: $query)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    guard query.isEmpty == false else { return }
                    
                    Task {
                        await recipeViewModel.fetchRecipeList(query: query)
                    }
                } label: {
                    Text("Search")
                }
                .buttonStyle(.borderedProminent)
            }
            
            if recipeViewModel.recipeList.isEmpty {
                Text("""
                     No recipes found.
                     Enter a query to search for one.
                     """)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
            } else {
                List(recipeViewModel.recipeList) { recipe in
                    HStack {
                        if let url = URL(string: recipe.image) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFill()
                                    .clipShape(.rect(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                            
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                        }
                        Text(recipe.title)
                    }
                }
                .listStyle(.plain)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var recipeViewModel = RecipeViewModel()
    ContentView()
        .environment(recipeViewModel)
}
