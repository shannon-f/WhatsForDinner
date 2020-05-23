//
//  MealsView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/22/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct MealsView: View {
    var meals : [Meal]
    
    var body: some View {
        List {
            ForEach(meals, id: \.self) { meal in
                MealView(meal: meal)
            }
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newMeal = Meal.init(context: context)
        newMeal.mealTime = MealTime.Breakfast.rawValue
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        
        let meals = [newMeal]
        return MealsView(meals: meals)
    }
}
