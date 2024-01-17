//
//  RecipeDetailView.swift
//  AvocadoKir
//
//  Created by Test on 3.10.23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    @State private var pulsate: Bool = false
    @Environment(\.dismiss) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                Image(recipe.image)
                    .resizable()
                .scaledToFit()
                
                Group {
                    //title
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    
                    //ratings
                    RecipeRatingView(recipe: recipe)
                   
                    //cooking
                    RecipeCookingView(recipe: recipe)
                    
                    //ingredients
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    //instructions
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundStyle(Color("ColorGreenAdaptive"))
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .ignoresSafeArea()
        .overlay {
            HStack {
                Spacer()
                VStack {
                    Button {
                        presentationMode.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                }
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
            .onAppear(perform: {
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    pulsate.toggle()
                }
            })
        }
    }
}

#Preview {
    RecipeDetailView(recipe: recipesData[0])
}
