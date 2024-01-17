//
//  RecipeCardView.swift
//  AvocadoKir
//
//  Created by Test on 3.10.23.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundStyle(Color.white)
                                .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            .padding(.trailing, 20)
                            .padding(.top, 22)
                            Spacer()
                        }
                    }
                }
            VStack(alignment: .leading, spacing: 12) {
                //title
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ColorGreenMedium"))
                    .lineLimit(1)
                //headline
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundStyle(Color.gray)
                    .italic()
                //rates
                RecipeRatingView(recipe: recipe)
                //cooking
                RecipeCookingView(recipe: recipe)
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal, content: {
            RecipeDetailView(recipe: recipe)
        })
    }
}

#Preview {
    RecipeCardView(recipe: recipesData[0])
}
