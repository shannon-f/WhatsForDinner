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
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.mealTime, ascending: true)
        ]/*, TODO move this to day's view and figure out how to use filter based on what day of the week the date is
        predicate: NSPredicate(format: "date == %@", "Dinner")*/
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        TabView(selection: $selection){
            VStack {
                WeekView()
            }.tabItem {
                VStack {
                    Text("Week")
                }
            }.tag(0)
            
            VStack{
                MealsView(meals: Array(meals))
            }.tabItem {
                VStack {
                    Text("Meals")
                }
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}
