//
//  MealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct MealView: View {
    var mealTime : MealTime
    var meal : Meal
    
    init(mealTime: MealTime, meal : Meal) {
        self.mealTime = mealTime
        self.meal = meal
    }
    
    var body: some View {
        VStack {
            Text(self.mealTime.rawValue)
        }
        
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(mealTime: .Breakfast, meal: Meal(entree: "Eggs", side1: "Bacon", side2: "Yogurt"))
    }
}
