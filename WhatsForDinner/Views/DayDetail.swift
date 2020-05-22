//
//  DayView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct DayDetail: View {
    var dayOfTheWeek : String
    var meals : [Meal]
    
    var body: some View {
        VStack {
            HStack {
                Text(dayOfTheWeek).font(.largeTitle).padding()
                Spacer()
            }
            List {
                        ForEach(self.meals.filter {
                            return dateToDayOfWeek($0.date!) == dayOfTheWeek
                        }, id: \.self) { meal in
//                            Section(header: Text("Test")) {
                                    MealView(meal: meal)
                            
//                                }
                            
                        }
                
            }
            
            Spacer()
        }
        
    }
    
    func dateToDayOfWeek(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        // todo replace Date() with meal date
        let date = Date()
        let dayOfWeekString = dateFormatter.string(from: date)
        return dayOfWeekString
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newMeal = Meal.init(context: context)
        newMeal.mealTime = "Breakfast"
        newMeal.entree = "Eggs"
        newMeal.side1 = "Bacon"
        newMeal.side2 = "Toast"
        newMeal.date = Date()
        return DayDetail(dayOfTheWeek: "Thursday", meals: [newMeal])
        
    }
}
