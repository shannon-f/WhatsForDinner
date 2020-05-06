//
//  DayView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/4/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct DayView: View {
    var dayOfTheWeek : String
    var meals = [MealView]()
    
    init(dayOfTheWeek: String, mealViews: [MealView]) {
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
                        meals[0].padding()
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
        DayView(dayOfTheWeek: "Monday", mealViews: [MealView(mealTime: .Breakfast, meal: Meal(entree: "Eggs", side1: "Bacon", side2: "Yogurt"))])
    }
}
