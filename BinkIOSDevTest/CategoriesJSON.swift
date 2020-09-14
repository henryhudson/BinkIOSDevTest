//
//  CategoriesJSON.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct CategoryInfo: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

struct CategoriesJSON: Decodable {
    let categories: [CategoryInfo]
}
