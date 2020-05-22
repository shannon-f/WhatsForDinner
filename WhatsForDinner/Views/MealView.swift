//
//  MealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct MealView: View {
//    var mealTime : MealTime
    var meal : Meal
    
//    init(mealTime: MealTime, meal : Meal) {
//        self.mealTime = mealTime
//        self.meal = meal
//    }
    
    var body: some View {
        VStack {
//            HStack {
            HStack {
                Text(self.meal.mealTime ?? "").font(.largeTitle)
                Spacer()
            }
//                Text(self.meal.name ?? "").font(.title)
                Spacer()
//            }
            HStack {
                VStack {
                    HStack {
                        Text(self.meal.entree ?? "").padding()
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(self.meal.side1 ?? "").padding()
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(self.meal.side2 ?? "").padding()
                        Spacer()
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newMeal = Meal.init(context: context)
        newMeal.name = "The Usual"
        newMeal.mealTime = MealTime.Breakfast.rawValue
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        return MealView(meal: newMeal)
    }
}
