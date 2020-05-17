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
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.name, ascending: true)
        ]/*,
        predicate: NSPredicate(format: "date == %@", "Dinner")*/
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        VStack {
            HStack {
                Text(dayOfTheWeek).font(.largeTitle).padding()
                Spacer()
            }
            List {
                VStack {
                    HStack {
                        ForEach(meals, id: \.self) { meal in
                            VStack {
                                Text(meal.name ?? "")
                                Text(meal.entree ?? "")
                                Text(meal.side1 ?? "")
                                Text(meal.side2 ?? "")
                            }
                        }
                        
                        Spacer()
                    }
                }
                
            }
            
            Spacer()
        }
        
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
                let newMeal = Meal.init(context: context)
        newMeal.name = "Breakfast"
        newMeal.entree = "Eggs"
        return DayDetail(dayOfTheWeek: "Monday")
    }
}
