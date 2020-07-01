//
//  ContentView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var days = [DayDetail]()
    var meals: [Meal]
    
    var body: some View {
        NavigationView {
            VStack {
                // TODO replace this with collage of week's meal images?
                Image("meal-icon").resizable()
                Divider()
                List {
                    ForEach(Day.allCases, id: \.self) { day in
                        
                        NavigationLink (destination: DayDetail(dayOfTheWeek: day.rawValue, meals:Array(self.meals))) {
                            Text(day.rawValue)
                        }
                        .navigationBarTitle("This Week")
                    }
                }
            }
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newMeal = Meal.init(context: context)
        newMeal.mealTime = MealTime.Breakfast.rawValue
        newMeal.date = Date()
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        
        let meals = [newMeal]
        return WeekView(meals: meals)
    }
}
