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
                VStack {
                    HStack {
                        
                        ForEach(self.meals.filter {
                            func dateToDayOfWeek(_ date: Date) -> String {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "EEEE"
                                let dayOfWeekString = dateFormatter.string(from: date)
                                return dayOfWeekString
                            }
                            
                            return dateToDayOfWeek($0.date!) == dayOfTheWeek
                            
                        }, id: \.self) { meal in
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
    
    func dateToDayOfWeek() -> String {
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
        newMeal.name = "Breakfast"
        newMeal.entree = "Eggs"
        newMeal.date = Date()
        return DayDetail(dayOfTheWeek: "Monday", meals: [newMeal])
        
    }
}
