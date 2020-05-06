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
    var meals : [Meal]
    
    init(dayOfTheWeek: String) {
        self.dayOfTheWeek = dayOfTheWeek
        meals = []
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(dayOfTheWeek).font(.largeTitle).padding()
                Spacer()
            }
            HStack {
                Text("Breakfast").padding()
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dayOfTheWeek: "Monday")
    }
}
