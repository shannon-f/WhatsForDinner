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
    @State var day = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
       
        VStack {
            // TODO improve the date picker, maybe only display days of the week and convert that to a date, maybe even tie the day of the week segmented picker to the date picker?
//            DatePicker("", selection: $mealDate, in: Date()...) .padding(.top)
//            Spacer()
            DayPickerView(mealDay: $day).padding()
            Picker("Meal Time", selection: $mealTime) {
                
                ForEach(MealTime.allCases, id: \.self) { mealTime in
                    Text(mealTime.rawValue).tag(mealTime.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle()).padding()
//            Divider()
            // TODO refactor to have variable number of meal items
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
        newMeal.date = day
        newMeal.mealTime = mealTime
        do {
          try managedObjectContext.save()
            // TODO navigate to newly created meal?
        } catch let error as NSError {
          //todo Show error message to user?
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
//    func getEarliestDateFor(dayOfTheWeek: Day) -> Date? {
//        let calendar = Calendar(identifier: .gregorian)
//        let dateComponents = DateComponents()
//        dateComponents.day =
//        guard let date = calendar.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .strict) else {
//            return Date()
//        }
//
//        return date
//    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView(day: Date()).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}


