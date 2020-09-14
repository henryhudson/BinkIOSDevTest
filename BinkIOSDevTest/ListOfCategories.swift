//
//  ListOfCategories.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct ListOfCategories: View {
    @State private var catInfo: [CategoryInfo] = [CategoryInfo]()
    @State private var catNames: [String] = []
    @State private var catImages: [String] = []
    @State private var catDescriptions: [String] = []
    
    var body: some View {
        ZStack {
            VStack {
                if catInfo.count > 0 {
                    
                    Text(catInfo[0].strCategory)
                    
                    RemoteImage(url: catInfo[0].strCategoryThumb, loading: Image(systemName: "icloud"), failure: Image(systemName: "xmark.circle"))
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(catInfo[0].strCategoryDescription)
                    
                }
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.1)) {
                getJSON(urlString: "https://www.themealdb.com/api/json/v1/1/categories.php") { (data: CategoriesJSON?) in
                    if let data = data {
                        
                        catInfo = data.categories
                        
                        
                        for i in catInfo {
                            catNames.append(i.strCategory)
                            catImages.append(i.strCategoryThumb)
                            catDescriptions.append(i.strCategoryDescription)
                            
                        }
                        
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
