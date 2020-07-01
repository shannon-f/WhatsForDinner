//
//  DaySelectorView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/15/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct DayPickerView: View {
    @Binding var mealDay : Date
        
    
    var body: some View {
        let daysOfTheWeek = getNext7Days()
        return Picker("Meal Day", selection: $mealDay) {
            ForEach(daysOfTheWeek, id: \.self) { date in
                Text((date.toDayOfTheWeek()).prefix(2)).border(Color.blue).frame(width: 400, height: 200)
            }
        }.pickerStyle(SegmentedPickerStyle()).padding()
    }
    
    func getNext7Days() -> [Date] {
        var dates = [Date]()
        let calendar = Calendar(identifier: .gregorian)
        for i in 0...6 {
            let date = calendar.date(byAdding: .day, value: i, to: Date())!
            dates.append(date)
        }
        return dates
    }
}

struct DaySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerView(mealDay: .constant(Date()))
    }
}
