//
//  ActualRecipie.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct ActualRecipie: View {
    
    @State var recipieId: String = "52772"
    //@State var recipie: Recipie = Recipie(strMeal: "", strArea: "Finland", strInstructions: "")
    
    @State var origion = "Italian"
    @State var recipieInstructions = "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm."
    @State var youtubeLink = "https://www.youtube.com/watch?v=1IszT_guI08"
    @State var mealTitle = "Spicy Arrabiata Penne"
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 10) {
                    //Text(recipie.strArea)
                    
                    Text(mealTitle)
                        .bold()
                        .font(.title)
                    
                    Text(origion)
                        .font(.headline)
                    
                    Text(recipieInstructions)
                        .padding(.horizontal)
                    
                    Link("Video Recipie", destination: URL(string: youtubeLink)!)
                    
                }
            }
            
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.1)) {
                getJSON(urlString: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + recipieId) { (data: Recipie?) in
                    if let data = data {
                        //recipie = data
                        
                        origion = data.strArea
                        //Recipie(strMeal: data.strMeal, strArea: data.strArea, strInstructions: data.strInstructions)
                    
                    }
                }
            }
        }
    }
}

struct ActualRecipie_Previews: PreviewProvider {
    static var previews: some View {
        ActualRecipie()
    }
}
