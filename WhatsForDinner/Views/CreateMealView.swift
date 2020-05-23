//
//  CreateMealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI
import CoreData

struct CreateMealView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    // TODO refactor to have a variable number of food items, pull food data from https://fdc.nal.usda.gov and use to autocomplete meal item fields
    @State var entree  = ""
    @State var mealTime = ""
    @State var side1  = ""
    @State var side2  = ""
    
    

    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var mealDate = Date()
    
    var body: some View {
       
        VStack {
            // TODO improve the date picker, maybe only display days of the week and convert that to a date
            DatePicker(selection: $mealDate, in: Date()..., displayedComponents: .date) {
                Text(mealDate.toDayOfTheWeek()).padding()
            }.padding(.top)
//            Spacer()
            Picker("Meal Time", selection: $mealTime) {
                
                ForEach(MealTime.allCases, id: \.self) { mealTime in
                    Text(mealTime.rawValue).tag(mealTime.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle()).padding()
//            Divider()
            TextField("Entree", text: $entree).padding()
            TextField("Side 1", text: $side1).padding()
            TextField("Side 2", text: $side2).padding()
            Button(action:{
                self.saveMeal()
                
            }) {
                Text("Save Meal")
            }
            Spacer()
        }
    }
    
    func saveMeal() {
        let newMeal = Meal(context: self.managedObjectContext)
        newMeal.entree = entree
        newMeal.side1 = side1
        newMeal.side2 = side2
        newMeal.date = mealDate
        newMeal.mealTime = mealTime
        do {
          try managedObjectContext.save()
        } catch let error as NSError {
          //todo Show error message to user?
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView()
    }
}


