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
    var daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var days = [DayDetail]()
    var meals: [Meal]
    
    var body: some View {
        // TODO convert this into tabbed view
        NavigationView {
            VStack {
                // TODO replace this with collage of week's meal images?
                Image("meal-icon").resizable()
                Divider()
                List {
                    ForEach(daysOfTheWeek, id: \.self) { day in
                        
                        NavigationLink (destination: DayDetail(dayOfTheWeek: day, meals:Array(self.meals))) {
                                Text(day)
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
        let newMeal = Meal()
        newMeal.mealTime = MealTime.Breakfast.rawValue
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        
        let meals = [newMeal]
        return WeekView(meals: meals).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}
