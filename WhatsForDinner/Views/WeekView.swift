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
    var day = "Monday"
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.mealTime, ascending: true)
        ]/*, TODO move this to day's view and figure out how to use filter based on what day of the week the date is
        predicate: NSPredicate(format: "date == %@", "Dinner")*/
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        // TODO convert this into tabbed view
        NavigationView {
        VStack {
            // TODO replace this with collage of week's meal images?
            Image("meal-icon").resizable()
            Divider()
            HStack{
                ZStack {
                        List {
                            ForEach(daysOfTheWeek, id: \.self) { day in
                                
                                NavigationLink (destination: DayDetail(dayOfTheWeek: day, meals:Array(self.meals))) {
                                        Text(day)
                                }
                                .navigationBarTitle("This Week")
                            }
                        }
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Button(action: {}) {
                                // TODO refactor this into a modal sheet?
                                NavigationLink (destination: CreateMealView()) {
                                        Image(systemName: "plus.circle").resizable().frame(width: 50, height: 50).padding()
                                }
                                
                            }
                        }
                    }
                }
            }
            }
        }
    }
    
    func dateToDayOfWeek(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        // todo replace Date() with meal date
        let date = Date()
        let dayOfWeekString = dateFormatter.string(from: date)
        return dayOfWeekString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}
