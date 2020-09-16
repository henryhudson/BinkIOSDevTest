//
//  RecipiesForCategory.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct RecipiesForCategory: View {
    @State private var mealInfo: [Meal] = [Meal]()
    @State var selectedCategory: String //= "Seafood"
    
    var body: some View {
    ZStack {
            ScrollView {
                VStack {
                    if mealInfo.count > 0 {
                        
                        ForEach( 0 ..< mealInfo.count) { i in
                            
                            NavigationLink(
                                destination: ActualRecipie(mealTitle: mealInfo[i].strMeal),
                                label: {
                                    ZStack {
                                        RemoteImage(url: mealInfo[i].strMealThumb, loading: Image(systemName: "icloud"), failure: Image(systemName: "xmark.circle"))
                                            .scaledToFit()
                                        
                                        Text(mealInfo[i].strMeal)
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .bold()
                                            .offset(y: 100)
                                            .shadow(color: .black, radius: 1.5, x: 0.0, y: 0.0)
                                    }
                                }
                                
                            )
                        }
                    }
                }
            
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.1)) {
                getJSON(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + selectedCategory) { (data: Meals?) in
                    if let data = data {
                        mealInfo = data.meals
                    }
                }
            }
        }
    }
}

struct RecipiesForCategory_Previews: PreviewProvider {
    static var previews: some View {
        RecipiesForCategory(selectedCategory: "Seafood")
    }
}
