//
//  ListOfCategories.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct ListOfCategories: View {
    @State private var catInfo: [CategoryInfo] = [CategoryInfo]()
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack {
                        if catInfo.count > 0 {
                            
                            ForEach(0 ..< catInfo.count) { i in
                                VStack {
                                    NavigationLink(
                                        destination: RecipiesForCategory(selectedCategory: catInfo[i].strCategory) ,
                                        label: {
                                            VStack {
                                                RemoteImage(url: catInfo[i].strCategoryThumb, loading: Image(systemName: "icloud"), failure: Image(systemName: "xmark.circle"))
                                                    .scaledToFit()
                                                
                                                Text(catInfo[i].strCategory)
                                                    .foregroundColor(.white)
                                                    .font(.title)
                                                    .bold()
                                                    .shadow(color: .black, radius: 1, x: 0, y: 0)
                                            }
                                        })
                                }
                            }
        //                    Text(catInfo[0].strCategoryDescription)
                        }
                    }
                }
                .navigationTitle("Categories")
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.1)) {
                getJSON(urlString: "https://www.themealdb.com/api/json/v1/1/categories.php") { (data: CategoriesJSON?) in
                    if let data = data {
                        
                        catInfo = data.categories
                        
                    }
                }
            }
        }
    }
}

struct ListOfCategories_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCategories()
    }
}
