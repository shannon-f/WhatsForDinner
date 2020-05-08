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
    var meals = [Meal]()
    
    init(dayOfTheWeek: String, mealViews: [Meal]) {
        self.dayOfTheWeek = dayOfTheWeek
        meals = mealViews
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(dayOfTheWeek).font(.largeTitle).padding()
                Spacer()
            }
            List {
                VStack {
                    HStack {
                        ForEach(meals) { meal in
                            MealView(mealTime: .Breakfast, meal: meal).padding()
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
        DayDetail(dayOfTheWeek: "Monday", mealViews: [Meal(entree: "Eggs", side1: "Bacon", side2: "Yogurt")])
    }
}
