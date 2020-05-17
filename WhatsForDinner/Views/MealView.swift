//
//  MealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct MealView: View {
    var mealTime : MealTime
    var meal : Meal
    
    init(mealTime: MealTime, meal : Meal) {
        self.mealTime = mealTime
        self.meal = meal
    }
    
    var body: some View {
        VStack {
//            HStack {
                Text(self.meal.name ?? "").font(.title)
                Spacer()
//            }
//            HStack {
//                Text("Test")
                Text(self.meal.entree ?? "")
//                Text(self.meal.side1)
//                Text(self.meal.side2)
//            }
        }
        
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newMeal = Meal.init(context: context)
        newMeal.name = "Breakfast"
        newMeal.entree = "Eggs"
        return MealView(mealTime: .Breakfast, meal: newMeal)
    }
}
