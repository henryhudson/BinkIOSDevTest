//
//  ListOfCategories.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct ListOfCategories: View {
    //@State var jsonData = [CategoriesJSON]()
    @State var categories = [String]()
    
    var body: some View {
        ZStack {
            ForEach(0 ..< categories.count) { i in
                Text(categories[i] )
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.1)) {
                getJSON(urlString: "https://www.themealdb.com/api/json/v1/1/categories.php") { (data: CategoryInfo?) in
                    if let data = data {
                        categories.append(data.strCategory)
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
