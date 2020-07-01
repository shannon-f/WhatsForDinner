//
//  DayView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI
import CoreData

struct DayDetail: View {
    var dayOfTheWeek : String
    var meals : [Meal]
    var isAllMealsView : Bool
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {

            List {
                if (self.meals.filter {
                    return $0.date!.toDayOfTheWeek() == dayOfTheWeek
                }.count != 0 || !isAllMealsView){
                    HStack {
                        Text(dayOfTheWeek).font(.largeTitle).padding()
                        Spacer()
                    }
                }
                ForEach(self.meals, id: \.self) { meal in
                    MealView(meal: meal)
                }.onDelete(perform: deleteMeal)
            }
    }
    
    func deleteMeal(at offsets: IndexSet) {
        for offset in offsets {
            // find this meal in our fetch request
            let meal = meals[offset]

            // delete it from the context
            managedObjectContext.delete(meal)
        }

        // save the context
        try? managedObjectContext.save()
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
        return DayDetail(dayOfTheWeek: newMeal.date!.toDayOfTheWeek(), meals: [newMeal], isAllMealsView: false)
        
    }
}
