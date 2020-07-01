//
//  ContentView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/22/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var creatingMeal = false
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.mealTime, ascending: true)
        ]
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        TabView(selection: $selection){
            VStack {
                WeekView(meals: Array(meals))
            }.tabItem {
                Image(systemName: "calendar")
                Text("Week")
            }.tag(0)
            VStack {
                CreateMealView()
            }.tabItem {
                VStack {
                    Image(systemName: "plus.circle")
                    Text("Create Meal")
                }
            }.tag(1)
            AllMealsView(meals: Array(meals))
                .tabItem {
                VStack {
                    Image("knife-and-fork-icon")
                    Text("Meals")
                }
            }.tag(2)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}

struct AllMealsView: View {
    var meals: [Meal]
     @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        return List {
            ForEach(meals, id: \.self) { meal in
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
