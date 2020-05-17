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
    
    var body: some View {
        NavigationView {
        VStack {
            Image("meal-icon").resizable()
            Divider()
            HStack{
                ZStack {
                        List {
                            ForEach(daysOfTheWeek, id: \.self) { day in
                                NavigationLink (destination: DayDetail(dayOfTheWeek: day/*, mealViews:[Meal]()*/)) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
