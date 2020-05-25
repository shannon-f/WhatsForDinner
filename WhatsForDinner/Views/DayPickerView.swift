//
//  DaySelectorView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/15/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct DayPickerView: View {
//    @Binding var mealDay : Day?
    @State var mealDay = ""
    
    var body: some View {
        Picker("Meal Day", selection: $mealDay) {
            ForEach(Day.allCases, id: \.self) { day in
                
                Text((day.rawValue).prefix(2)).border(Color.blue).frame(width: 400, height: 200).tag(day.rawValue)
                
                
            }
        }.pickerStyle(SegmentedPickerStyle()).padding()
    }
}

struct DaySelectorView_Previews: PreviewProvider {
    static var previews: some View {
//        DayPickerView(mealDay: .constant(.Monday))
        DayPickerView()
    }
}
