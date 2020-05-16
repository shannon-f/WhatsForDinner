//
//  CreateMealView.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/6/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import SwiftUI

struct CreateMealView: View {
    @State var entree  = ""
    @State var mealName = ""
    @State var side1  = ""
    @State var side2  = ""
//    @State var day : Day?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var mealDate = Date()
    
    var body: some View {
       
        VStack {
            DatePicker(selection: $mealDate, in: Date()..., displayedComponents: .date) {
                Text("Meal date")
            }.padding(.top)
//            Spacer()
            TextField("Meal Name", text: $mealName).padding()
//            Divider()
            TextField("Entree", text: $entree).padding()
            TextField("Side 1", text: $side1).padding()
            TextField("Side 2", text: $side2).padding()
            Button(action:{}) {
                Text("Save Meal")
            }
            Spacer()
        }
    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView()
    }
}
