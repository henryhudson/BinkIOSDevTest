//
//  RecipiesForCategoryJSON.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 14/09/2020.
//

import SwiftUI

struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct Meals: Decodable {
    let meals: [Meal]
}
