//
//  RecipeRatingView.swift
//  AvocadoKir
//
//  Created by Test on 3.10.23.
//

import SwiftUI

struct RecipeRatingView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                .foregroundStyle(Color.yellow)
            }
        }
    }
}

#Preview {
    RecipeRatingView(recipe: recipesData[0])
}
