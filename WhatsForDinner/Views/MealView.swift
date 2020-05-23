//
//  MealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct MealView: View {
    var meal : Meal
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text(self.meal.date?.toDayOfTheWeek() ?? "").font(.largeTitle).padding()
                        Spacer()
                    }
                    HStack {
                        Text(self.meal.mealTime ?? "").font(.title).padding()
                        Spacer()
                    }
                }
                
                Spacer()
            }
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
        newMeal.mealTime = MealTime.Breakfast.rawValue
        newMeal.date = Date()
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        return MealView(meal: newMeal)
    }
}
