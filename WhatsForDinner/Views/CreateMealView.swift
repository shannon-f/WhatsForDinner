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
    @State var side1  = ""
    @State var side2  = ""
    @State var day : Day?
    
    var body: some View {
       
        VStack {
            ForEach(Day.allCases, id: \.self) { day in
            //            Button(){
            //                Shape()
            //            }
                Text(day.rawValue)
                    }
            Text("New Meal")
            TextField("Entree", text: $entree)
            TextField("Side 1", text: $side1)
            TextField("Side 2", text: $side2)
        }
    }
}

struct CreateMealView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMealView(day:.Monday)
    }
}
