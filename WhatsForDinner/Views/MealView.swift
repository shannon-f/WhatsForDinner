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
                        Text(self.meal.mealTime ?? "").font(.title).padding(.leading).padding(.bottom)
                        Spacer()
                    }
                }
                
                Spacer()
            }
            HStack {
                VStack {
                    HStack {
                        Text(self.meal.entree ?? "").padding(.leading)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(self.meal.side1 ?? "").padding(.leading)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(self.meal.side2 ?? "").padding(.leading)
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
